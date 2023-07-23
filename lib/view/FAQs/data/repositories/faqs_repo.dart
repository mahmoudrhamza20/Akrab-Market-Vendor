import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/models/error_model.dart';
import '../../../../core/utils/end_points.dart';
import '../models/faqs_model.dart';

class FAQsRepo {
  Future<Either<String, FAQsModel>> getFAQs() async {
    final response = await DioHelper.get(EndPoints.endpointFAQs);
    try {
      if (response.statusCode == 200) {
        log("Success getFAQsRepo");
        return Right(FAQsModel.fromJson(jsonDecode(response.toString())));
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
