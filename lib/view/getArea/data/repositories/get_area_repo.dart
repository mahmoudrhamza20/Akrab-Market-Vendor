import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/models/error_model.dart';
import '../../../../core/utils/end_points.dart';
import '../models/get_area_model.dart';

class GetAreaRepo {
  Future<Either<String, GetAreaModel>> getArea() async {
    final response = await DioHelper.get(EndPoints.endpointGetArea);
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success GetAreaRepo");
        return Right(GetAreaModel.fromJson(jsonDecode(response.toString())));
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
