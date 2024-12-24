import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/features/menu/data/models/meal_model.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_alert_dialog.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';

class MenuItemComponent extends StatelessWidget {
  const MenuItemComponent({
    super.key,
    required this.model,
  });

  final MealModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // image
        SizedBox(
          height: 60.h,
          width: 60.w,
          child: CustomCachedNetworkImage(
            imageUrl: model.images[0],
            // "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=600",
          ),
          /* Image.network(
            '',
          ), */
        ),
        SizedBox(
          width: 8.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Colors.black,
                  ),
            ),
            /* CustomTextMealComponent(
              text: model.name,
            ), */
            CustomTextMealComponent(
              text: model.description,
            ),
            // CustomTextMealComponent(model: model),
            /* SizedBox(
              width: 180.w,
              child: Text(
                model.description,
                overflow: TextOverflow.ellipsis,
              ),
            ), */
            /* Text(
              model.description,
            ), */
            Text(
              model.price.toString() + AppStrings.le.tr(context),
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Colors.black12,
                  ),
            ),
          ],
        ),
        Spacer(),
        BlocConsumer<MenuCubit, MenuState>(
          listener: (context, state) {
            if (state is DeleteDishSuccessState) {
              BlocProvider.of<MenuCubit>(context).getAllMeals();
            }
          },
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomAlertDialog(
                      message: AppStrings.deleteMeal.tr(context),
                      confirmAction: () {
                        BlocProvider.of<MenuCubit>(context).deleteDish(
                          model.id,
                        );
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
              icon: Icon(
                Icons.cancel,
                color: AppColors.red,
                size: 40.0,
              ),
            );
          },
        ),
      ],
    );
  }
}

class CustomTextMealComponent extends StatelessWidget {
  const CustomTextMealComponent({
    super.key,
    required this.text,
    // required this.model,
  });

  // final MealModel model;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 180.w,
      ),
      child: Text(
        text,
        // model.description,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: Colors.black12,
            ),
      ),
    );
  }
}

// 1. Navigator.pop
// 2. show Circular Progress Indicator