import 'package:chef_app/core/database/api/api_consumer.dart';
import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/error/exceptions.dart';
import 'package:chef_app/core/services/services_locator.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/features/menu/data/models/meal_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

class MenuRepository {
  Future<Either<String, String>> addDishToMenu({
    required XFile image,
    required String mealName,
    required double mealPrice,
    required String mealDesc,
    required String mealCategory,
    required String howToSell,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.addMeal,
        isFormData: true,
        data: {
          ApiKeys.name: mealName,
          ApiKeys.price: mealPrice,
          ApiKeys.description: mealDesc,
          ApiKeys.category: mealCategory,
          ApiKeys.howToSell: howToSell,
          ApiKeys.mealImages: await uploadImageToApi(image),
        },
      );
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> deleteMeal({
    required String id,
  }) async {
    try {
      final response = await sl<ApiConsumer>().delete(
        EndPoint.getdeleteMealEndPoint(id),
      );
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, GetAllMealsModel>> getMeals() async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.getAllChefMeals(
          sl<CacheHelper>().getData(
            key: ApiKeys.id,
          ),
        ),
      );
      return Right(
        GetAllMealsModel.fromJson(response),
      );
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
