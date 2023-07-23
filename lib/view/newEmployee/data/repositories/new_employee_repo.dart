import 'dart:convert';
import 'dart:developer';
import 'package:akrab_market_vendor/view/newEmployee/data/models/add_employee_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/models/error_model.dart';
import '../../../../core/utils/end_points.dart';

class NewEmployeeRepo {
  Future<Either<String, AddEmployeeModel>> addNewEmployee({
    required String name,
    required String email,
    required String phone,
    required String password,
    int? storeId,
    int? provianceID,
    int? cityID,
    int? areaID,
    String? photo,
  }) async {
    final response = await DioHelper.postWithoutBody(
      EndPoints.addEmployee,
      parameters: {
        "name": name,
        "email": email,
        "mobile": phone,
        "password": password,
        "Store_id": storeId,
        "ProvianceID": provianceID,
        "CityID": cityID,
        "AreaID": areaID,
        "photo": photo,
      },
    );
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success addNewEmployee");
        return Right(
            AddEmployeeModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .error
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

// Future<Either<String, AddMarketCommentsModel>> getProfileDetails() async {
  //   final response =
  //       await DioHelper.get(EndPoints.endpointProfileDetails, headers: {
  //     'user': AppStorage.getUserId,
  //   });
  //   try {
  //     if (response.statusCode == 200 && response.data['status'] == 'success') {
  //       log("Success GetProfileDetailsRepo");
  //       return Right(AddMarketCommentsModel.fromJson(jsonDecode(response.toString())));
  //     } else {
  //       return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
  //           .error
  //           .toString());
  //     }
  //   } catch (e) {
  //     return Left(e.toString());
  //   }
  // }

  // Future<Either<String, UserModel>> editImageProfile(
  //   XFile photo,
  // ) async {
  //   String fileName = photo.path.split('/').last;

  //   FormData body = FormData.fromMap({
  //     "photo": await MultipartFile.fromFile(photo.path, filename: fileName),
  //   });

  //   final response = await DioHelper.post(EndPoints.endpointEditProfile,
  //       headers: {
  //         'user': AppStorage.getUserId,
  //       },
  //       formData: body);
  //   try {
  //     if (response.statusCode == 200 && response.data['status'] == 'success') {
  //       log("Success EditImageProfileRepo");
  //       return Right(UserModel.fromJson(jsonDecode(response.toString())));
  //     } else {
  //       return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
  //           .error
  //           .toString());
  //     }
  //   } catch (e) {
  //     return Left(e.toString());
  //   }
  // }
}
