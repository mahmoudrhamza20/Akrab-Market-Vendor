import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/models/error_model.dart';
import '../../../../core/utils/end_points.dart';
import '../models/store_data_model.dart';

class GetStoreDataRepo {
  Future<Either<String, StoreDataModel>> getStoreData() async {
    final response = await DioHelper.postWithoutBody(
      EndPoints.editStore,
      parameters: {
        "Store_id": 50,
      },
    );
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success GetStore");
        return Right(StoreDataModel.fromJson(jsonDecode(response.toString())));
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
