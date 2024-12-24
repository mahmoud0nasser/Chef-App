import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/error/exceptions.dart';
import 'package:chef_app/core/services/services_locator.dart';
import 'package:chef_app/features/auth/data/models/login_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/database/api/end_points.dart';

class AuthRepository {
  Future<Either<String, LoginModel>> Login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.chefSignIn,
        data: {
          ApiKeys.email: email,
          ApiKeys.password: password,
        },
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> sendCode(String email) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.sendCode,
        data: {
          ApiKeys.email: email,
        },
      );
      return Right(
        response[ApiKeys.message],
      );
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
    required String code,
  }) async {
    try {
      final response = await sl<ApiConsumer>().patch(
        EndPoint.changeForgottenPassword,
        data: {
          ApiKeys.email: email,
          ApiKeys.password: password,
          ApiKeys.confirmPassword: confirmPassword,
          ApiKeys.code: code,
        },
      );
      return Right(
        response[ApiKeys.message],
      );
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
