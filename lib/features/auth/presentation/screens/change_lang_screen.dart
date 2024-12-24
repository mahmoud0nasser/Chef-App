import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image.dart';

class ChangeLangScreen extends StatelessWidget {
  const ChangeLangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            //! background Image
            CustomImage(
              imgPath: AppAssets.background,
              w: double.infinity,
            ),
            /* Image.asset(
              AppAssets.background,
              width: double.infinity,
              fit: BoxFit.fill,
            ), */
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 116.h,
                  ),
                  CustomImage(
                    imgPath: AppAssets.appLogo,
                    h: 120.h,
                    w: 120.w,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    AppStrings.welcomeToChefApp.tr(context),
                    // 'Welcome To Chef App',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: AppColors.white,
                          fontSize: 30.0,
                        ),
                  ),
                  /* SizedBox(
                    height: 56.h,
                    // height: 16.h,
                  ), */
                  SizedBox(
                    height: 20.h,
                    // height: 16.h,
                  ),
                  Text(
                    AppStrings.pleaseChooseYourLanguage.tr(context),
                    // 'Please Choose your Language',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 120.h,
                  ),
                  BlocBuilder<GlobalCubit, GlobalState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          CustomButton(
                            onPressed: () {
                              // BlocProvider.of<GlobalCubit>(context).isArabic = false;
                              BlocProvider.of<GlobalCubit>(context)
                                  .changeLang('en');
                              navigate(
                                context: context,
                                route: Routes.login,
                              );
                            },
                            text: 'English',
                            width: 140,
                            background: AppColors.black,
                          ),
                          Spacer(),
                          CustomButton(
                            onPressed: () {
                              // BlocProvider.of<GlobalCubit>(context).isArabic = true;
                              BlocProvider.of<GlobalCubit>(context)
                                  .changeLang('ar');
                              navigate(
                                context: context,
                                route: Routes.login,
                              );
                            },
                            text: 'العربية',
                            width: 140.0,
                            background: AppColors.black,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
