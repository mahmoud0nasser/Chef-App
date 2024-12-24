import 'package:chef_app/app/app.dart';
import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/services/services_locator.dart';
import 'package:chef_app/features/auth/presentation/cubits/forget_password_cubit/cubit/forget_password_cubit.dart';
import 'package:chef_app/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:chef_app/features/home/home_cubit/home_cubit.dart';
import 'package:chef_app/features/menu/presentation/cubit/menu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding();
  initServicesLocator();
  await sl<CacheHelper>().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GlobalCubit>()..getCachedLang(),
        ),
        BlocProvider(
          create: (context) => sl<LoginCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ForgetPasswordCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<MenuCubit>()..getAllMeals(),
        ),
      ],
      child: MyApp(),
      /* child: BlocProvider(
        create: (context) => sl<LoginCubit>(),
        child: MyApp(),
      ), */
    ),
  );
}
