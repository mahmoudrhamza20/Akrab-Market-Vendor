import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/models/error_model.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/utils/end_points.dart';

class LoginRepo {
  Future<Either<String, UserModel>> login({
    required String email,
    required String password,
  }) async {
    final response = await DioHelper.post(EndPoints.login, body: {
      'email': email,
      'password': password,
      //"DeviceToken": deviceToken,
    });
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success LoginRepo");
        return Right(UserModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .error
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
