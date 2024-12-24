import 'package:chef_app/core/locale/app_locale.dart';
import 'package:chef_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/bloc/cubit/global_cubit.dart';
import '../core/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        375,
        812,
      ),
      builder: (context, child) => BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('ar', "EG"),
              Locale('en', "US"),
            ],
            locale: Locale(
              BlocProvider.of<GlobalCubit>(context).langCode,
            ),
            initialRoute: Routes.initialRoute,
            onGenerateRoute: AppRoutes.generateRoute,
            // title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: getAppTheme(),
          );
        },
      ),
    );
  }
}
