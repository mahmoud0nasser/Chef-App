import 'package:chef_app/features/auth/presentation/screens/change_lang_screen.dart';
import 'package:chef_app/features/auth/presentation/screens/login_screen.dart';
import 'package:chef_app/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:chef_app/features/auth/presentation/screens/send_code_screen.dart';
import 'package:chef_app/features/home/screens/home_screen.dart';
import 'package:chef_app/features/menu/presentation/screens/add_meal_screen.dart';
import 'package:chef_app/features/menu/presentation/screens/menu_home.dart';
import 'package:chef_app/features/profile/presentation/screens/change_password_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/profile_home_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/setting_screen.dart';
import 'package:chef_app/features/profile/presentation/screens/update_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String login = '/login';
  static const String changeLang = '/changeLang';
  static const String sendCode = '/sendCode';
  static const String resetPassword = '/resetPassword';
  static const String menuHome = '/menuHome';
  static const String addMeal = '/addMeal';
  static const String profileHome = '/profileHome';
  static const String updateProfile = '/updateProfile';
  static const String setting = '/setting';
  static const String changePassword = '/changePassword';
  static const String home = '/home';
}

class AppRoutes {
  static Route? generateRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          // builder: (_) => HomeScreen(),
        );

      case Routes.changeLang:
        return MaterialPageRoute(
          builder: (_) => ChangeLangScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case Routes.sendCode:
        return MaterialPageRoute(
          builder: (_) => SendCodeScreen(),
        );
      case Routes.resetPassword:
        return MaterialPageRoute(
          builder: (_) => ResetPasswordScreen(),
        );

      case Routes.menuHome:
        return MaterialPageRoute(
          builder: (_) => MenuHomeScreen(),
        );
      case Routes.addMeal:
        return MaterialPageRoute(
          builder: (_) => AddMealScreen(),
        );

      case Routes.profileHome:
        return MaterialPageRoute(
          builder: (_) => ProfileHomeScreen(),
        );
      case Routes.updateProfile:
        return MaterialPageRoute(
          builder: (_) => UpdateProfileScreen(),
        );
      case Routes.setting:
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
        );
      case Routes.changePassword:
        return MaterialPageRoute(
          builder: (_) => ChangePasswordScreen(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No Found Route',
              ),
            ),
          ),
        );
    }
  }
}
