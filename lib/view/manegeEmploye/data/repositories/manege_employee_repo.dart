import 'dart:convert';
import 'dart:developer';
import 'package:akrab_market_vendor/view/manegeEmploye/data/models/get_employees_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/models/error_model.dart';
import '../../../../core/utils/end_points.dart';
import '../models/delete_employee_model.dart';

class ManegeEmployeeRepo {
  Future<Either<String, GetEmployeesModel>> getEmployees() async {
    final response = await DioHelper.postWithoutBody(
      EndPoints.employees,
      parameters: {
        "Store_id": 50,
      },
    );
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success GetEmployee");
        return Right(
            GetEmployeesModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .error
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

//delete employee
  Future<Either<String, DeleteEmployeesModel>> deleteEmployees(
      {required int userId}) async {
    final response = await DioHelper.postWithoutBody(
      EndPoints.deleteEmployee,
      parameters: {
        "user_id": userId,
      },
    );
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success DeleteEmployee");
        return Right(
            DeleteEmployeesModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .error
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

//edit employee
  Future<Either<String, GetEmployeesModel>> editEmployee({
    required String name,
    required int userId,
    required String email,
    required String phone,
    required String password,
    String? passwordConfirmation,
    int? storeId,
    int? provianceID,
    int? cityID,
    int? areaID,
    String? photo,
  }) async {
    final response = await DioHelper.postWithoutBody(
      EndPoints.addEmployee,
      parameters: {
        "user_id": userId,
        "name": name,
        "Store_id": 50,
        "email": email,
        "mobile": phone,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "photo": photo,
        "ProvianceID": provianceID,
        "CityID": cityID,
        "AreaID": areaID,
      },
    );
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success EditEmployee");
        return Right(
            GetEmployeesModel.fromJson(jsonDecode(response.toString())));
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
