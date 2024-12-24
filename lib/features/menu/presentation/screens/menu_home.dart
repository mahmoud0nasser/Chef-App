import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widgets/custom_loading_indicator.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../components/menu_item_component.dart';

class MenuHomeScreen extends StatelessWidget {
  const MenuHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(
            24.0,
          ),
          child: Column(
            children: [
              // add dish to Menu Button
              CustomButton(
                onPressed: () {
                  navigate(
                    context: context,
                    route: Routes.addMeal,
                  );
                },
                text: AppStrings.addDishToMenu.tr(context),
              ),
              // item
              BlocBuilder<MenuCubit, MenuState>(
                builder: (context, state) {
                  final menuCubit = BlocProvider.of<MenuCubit>(context);
                  return Expanded(
                    child: state is GetAllChefMealsLoadingState
                        ? CustomLoadingIndicator()
                        : menuCubit.meals.isEmpty
                            ? Center(
                                child: Text(
                                  AppStrings.noMeals.tr(context),
                                  // 'No Meals',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        color: AppColors.black,
                                      ),
                                ),
                              )
                            : ListView.builder(
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MenuItemComponent(
                                    model: menuCubit.meals[index],
                                  ),
                                ),
                                itemCount: menuCubit.meals.length,
                              ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
