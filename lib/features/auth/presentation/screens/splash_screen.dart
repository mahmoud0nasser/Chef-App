import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/database/api/end_points.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateAfterThreeSeconds();
    super.initState();
  }

  void navigateAfterThreeSeconds() {
    Future.delayed(
      Duration(seconds: 3),
    ).then(
      (value) async {
        await sl<CacheHelper>().getData(
                  key: ApiKeys.token,
                ) ==
                null
            ? navigate(
                context: context,
                route: Routes.changeLang,
              )
            : navigate(
                context: context,
                route: Routes.home,
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(
              imgPath: AppAssets.appLogo,
              h: 120.h,
              w: 120.w,
            ),
            /* SizedBox(
              height: 120.h,
              width: 120.w,
              child: Image.asset(
                AppAssets.appLogo,
              ),
            ), */
            SizedBox(
              height: 16.h,
            ),
            Text(
              AppStrings.chefApp.tr(context),
              // 'Chef App',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColors.white,
                    fontSize: 30.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
