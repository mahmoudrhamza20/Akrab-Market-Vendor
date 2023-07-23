import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/models/general_data_model.dart';
import '../../../../core/utils/end_points.dart';

class GeneralDataRepo {
  Future<Either<String, GeneralDataModel>> generalData() async {
    final response = await DioHelper.get(EndPoints.endpointGeneralData);
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success GeneralDataRepo");
        return Right(
            GeneralDataModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(response.data['data']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
