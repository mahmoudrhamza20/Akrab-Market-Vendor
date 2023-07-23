import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/models/error_model.dart';
import '../../../../core/utils/end_points.dart';
import '../models/accept_order_model.dart';
import '../models/order_details_model.dart';

class OrdersDataRepo {
  //Get Order Data
  Future<Either<String, OrderDetailsModel>> getOrderData() async {
    final response = await DioHelper.postWithoutBody(
      EndPoints.storeOrderDetails,
      parameters: {
        "OrderID": 30,
      },
    );
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success GetOrderData");
        return Right(
            OrderDetailsModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .error
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

//Accept Order

  Future<Either<String, AcceptOrdersModel>> acceptOrder() async {
    final response = await DioHelper.postWithoutBody(
      EndPoints.acceptOrder,
      parameters: {
        "OrderID": 30,
      },
    );
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success AcceptOrder");
        return Right(
            AcceptOrdersModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .error
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  //Refuse Order

  Future<Either<String, AcceptOrdersModel>> refuseOrder(
      {required String comment}) async {
    final response = await DioHelper.postWithoutBody(
      EndPoints.refuseOrder,
      parameters: {
        "OrderID": 30,
        "Comment": comment,
      },
    );
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success RefuseOrder");
        return Right(
            AcceptOrdersModel.fromJson(jsonDecode(response.toString())));
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
