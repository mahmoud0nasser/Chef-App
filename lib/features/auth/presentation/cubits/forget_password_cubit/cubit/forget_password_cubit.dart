import 'package:bloc/bloc.dart';
import 'package:chef_app/features/auth/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';

import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(
    this.authRepository,
  ) : super(ForgetPasswordInitial());
  final AuthRepository authRepository;
  GlobalKey<FormState> sendCodeKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  void sendCode() async {
    emit(SendCodeLoading());
    final res = await authRepository.sendCode(emailController.text);
    res.fold(
      (l) => emit(
        SendCodeError(l),
      ),
      (r) => emit(
        SendCodeSuccess(r),
      ),
    );
  }

  //! reset Password Logic
  //* new password text field
  TextEditingController newPasswordController = TextEditingController();

  bool isNewPasswordShowing = true;
  IconData suffixIconNewPassword = Icons.visibility;

  void changeNewPasswordSuffixIcon() {
    isNewPasswordShowing = !isNewPasswordShowing;
    suffixIconNewPassword =
        isNewPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeNewPasswordSuffixIcon());
  }

  //* confirm password text field
  TextEditingController confirmPasswordController = TextEditingController();

  bool isConfirmPasswordShowing = true;
  IconData suffixIconConfirmPassword = Icons.visibility;

  void changeConfirmPasswordSuffixIcon() {
    isConfirmPasswordShowing = !isConfirmPasswordShowing;
    suffixIconConfirmPassword =
        isConfirmPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeConfirmPasswordSuffixIcon());
  }

  //* Code
  TextEditingController codeController = TextEditingController();

  // change password method that recives new password and confirm password and code and email
  void resetPassword() async {
    emit(ResetPasswordLoading());
    final res = await authRepository.resetPassword(
      email: emailController.text,
      password: newPasswordController.text,
      confirmPassword: confirmPasswordController.text,
      code: codeController.text,
    );
    res.fold(
      (l) => emit(ResetPasswordError(l)),
      (r) => ResetPasswordSuccess(r),
    );
  }
}
