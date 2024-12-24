import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/services/services_locator.dart';
import 'package:chef_app/features/auth/data/models/login_model.dart';
import 'package:chef_app/features/auth/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this.authRepo,
  ) : super(LoginInitial());
  final AuthRepository authRepo;
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoginPasswordShowing = true;
  IconData suffixIcon = Icons.visibility;

  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordShowing = !isLoginPasswordShowing;
    suffixIcon =
        isLoginPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeLoginPasswordSuffixIcon());
  }

  // Login Method
  LoginModel? loginModel;

  void login() async {
    emit(LoginLoadingState());
    final result = await authRepo.Login(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (l) => emit(LoginErrorState(l)),
      (r) async {
        loginModel = r;
        Map<String, dynamic> decodedToken = JwtDecoder.decode(r.token);
        await sl<CacheHelper>().saveData(
          key: ApiKeys.id,
          value: decodedToken[ApiKeys.id],
        );
        await sl<CacheHelper>().saveData(
          key: ApiKeys.token,
          value: r.token,
        );
        emit(LoginSuccessState());
      },
    );
  }
}
