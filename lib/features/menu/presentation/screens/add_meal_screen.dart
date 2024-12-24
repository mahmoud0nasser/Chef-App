import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widgets/custom_file_image.dart';
import 'package:chef_app/core/widgets/custom_loading_indicator.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../components/image_picker_dialog.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.addDishToMenu.tr(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Center(
              child: BlocConsumer<MenuCubit, MenuState>(
                listener: (context, state) {
                  if (state is AddDishSuccessState) {
                    showToast(
                      message: AppStrings.mealAddedSucessfully,
                      state: ToastStates.success,
                    );
                    Navigator.pop(context);
                    BlocProvider.of<MenuCubit>(context).getAllMeals();
                  }
                },
                builder: (context, state) {
                  final menuCubit = BlocProvider.of<MenuCubit>(context);
                  return Form(
                    key: menuCubit.addToMenukey,
                    child: Column(
                      children: [
                        // add photo of meal
                        Stack(
                          children: [
                            // image
                            CustomFileImage(
                              image: menuCubit.image,
                            ),
                            /* CustomImage(
                              imgPath: AppAssets.imagePicker,
                            ), */
                            // add icon button
                            Positioned.directional(
                              textDirection: Directionality.of(context),
                              bottom: -8.0,
                              end: -8.0,
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ImagePickerDialog(
                                        cameraOnTap: () {
                                          Navigator.pop(context);
                                          pickImage(
                                            ImageSource.camera,
                                          ).then(
                                            (value) => menuCubit.takeImage(value),
                                            // (value) => menuCubit.image = value,
                                          );
                                          /* final ImagePicker picker = ImagePicker();
                                                    // Capture a photo.
                                                    final XFile? photo = await picker.pickImage(
                                                      source: ImageSource.camera,
                                                    ); */
                                        },
                                        galleryOnTap: () {
                                          Navigator.pop(context);
                                          pickImage(
                                            ImageSource.gallery,
                                          ).then(
                                            (value) => menuCubit.takeImage(value),
                                            // (value) => menuCubit.image = value,
                                          );
                                          /* final ImagePicker picker = ImagePicker();
                                                    // Pick an image.
                                                    final XFile? image = await picker.pickImage(
                                                      source: ImageSource.gallery,
                                                    ); */
                                        },
                                      );
                                    },
                                  );
                                },
                                icon: Icon(
                                  Icons.add,
                                  size: 35.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        // name textField
                        CustomTextFormField(
                          controller: menuCubit.mealNameController,
                          hint: AppStrings.mealName.tr(context),
                          validate: (data) {
                            if (data!.isEmpty) {
                              return AppStrings.pleaseEnterValidMealName
                                  .tr(context);
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        // price textField
                        CustomTextFormField(
                          controller: menuCubit.mealPriceController,
                          hint: AppStrings.mealPrice.tr(context),
                          validate: (data) {
                            if (data!.isEmpty) {
                              return AppStrings.pleaseEnterValidMealPrice
                                  .tr(context);
                            }
                            return null;
                          },
                        ),
                        // category dropMenu
                        SizedBox(
                          height: 48.h,
                          width: double.infinity,
                          child: DropdownButton(
                            isExpanded: true,
                            hint: Text(
                              AppStrings.category.tr(context),
                            ),
                            value: menuCubit.selectedItem,
                            items: menuCubit.categoryList
                                .map(
                                  (e) => DropdownMenuItem(
                                    child: Text(
                                      e,
                                    ),
                                    value: e,
                                  ),
                                )
                                .toList(),
                            onChanged: (data) {
                              menuCubit.changeItem(data);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        // Description
                        CustomTextFormField(
                          controller: menuCubit.mealDescController,
                          hint: AppStrings.mealDesc.tr(context),
                          validate: (data) {
                            if (data!.isEmpty) {
                              return AppStrings.pleaseEnterValidMealDesc
                                  .tr(context);
                            }
                            return null;
                          },
                        ),
                        // Quantity or Number
                        Row(
                          children: [
                            // quantity
                            Row(
                              children: [
                                Radio(
                                  activeColor: AppColors.primary,
                                  value: 'quantity',
                                  groupValue: menuCubit.groubVal,
                                  onChanged: (val) {
                                    menuCubit.changeGroupVal(val);
                                  },
                                ),
                                Text(
                                  AppStrings.mealQuantity.tr(context),
                                ),
                              ],
                            ),
                            Spacer(),
                            // number
                            Row(
                              children: [
                                Radio(
                                  activeColor: AppColors.primary,
                                  value: 'number',
                                  groupValue: menuCubit.groubVal,
                                  onChanged: (val) {
                                    menuCubit.changeGroupVal(val);
                                  },
                                ),
                                Text(
                                  AppStrings.mealNumber.tr(context),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        // add to Menu Button
                        state is AddDishLoadingState
                            ? CustomLoadingIndicator()
                            : CustomButton(
                                onPressed: () {
                                  if (menuCubit.addToMenukey.currentState!
                                      .validate()) {
                                    menuCubit.addDishToMenu();
                                  }
                                  /* navigate(
                              context: context,
                              route: Routes.addMeal,
                            ); */
                                },
                                text: AppStrings.addToMenu.tr(context),
                              ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
