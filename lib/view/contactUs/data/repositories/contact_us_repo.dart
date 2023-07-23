import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/utils/end_points.dart';

class ContactUsRepo {
  Future<Either<String, String>> contactUs(
      {required name,
      required String phone,
      required String msg,
      required String email}) async {
    final response =
        await DioHelper.post(EndPoints.endpointPostContactUS, body: {
      'Name': name,
      'Phone': phone,
      'Msg': msg,
      'email': email,
    });
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success ContactUsRepo");
        return Right(response.data['data']);
      } else {
        return Left(response.data['data']);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
