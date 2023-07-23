import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/appStorage/app_storage.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/models/error_model.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/utils/end_points.dart';

class ProfileRepo {
  Future<Either<String, UserModel>> getProfileDetails() async {
    final response =
        await DioHelper.get(EndPoints.endpointProfileDetails, headers: {
      'user': AppStorage.getUserId,
    });
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success GetProfileDetailsRepo");
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

  Future<Either<String, UserModel>> editProfileDetails(
      String name,
      String email,
      String phone,
      String password,
      String passwordConfirmation,
      int provianceID,
      int cityID,
      int areaID) async {
    FormData body = FormData.fromMap({
      "name": name,
      "email": email,
      "mobile": phone,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "ProvianceID": provianceID,
      "CityID": cityID,
      "AreaID": areaID,
    });

    final response = await DioHelper.post(EndPoints.endpointEditProfile,
        headers: {
          'user': AppStorage.getUserId,
        },
        formData: body);
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success EditProfileDetailsRepo");
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

  Future<Either<String, UserModel>> editImageProfile(
    XFile photo,
  ) async {
    String fileName = photo.path.split('/').last;

    FormData body = FormData.fromMap({
      "photo": await MultipartFile.fromFile(photo.path, filename: fileName),
    });

    final response = await DioHelper.post(EndPoints.endpointEditProfile,
        headers: {
          'user': AppStorage.getUserId,
        },
        formData: body);
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success EditImageProfileRepo");
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
