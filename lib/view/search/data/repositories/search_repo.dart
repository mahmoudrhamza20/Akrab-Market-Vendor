import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/dioHelper/dio_helper.dart';
import '../../../../core/models/error_model.dart';
import '../../../../core/models/list_of_markets.dart';
import '../../../../core/models/market_products_model.dart';
import '../../../../core/models/store_categories_model.dart';
import '../../../../core/models/store_main_categories_model.dart';
import '../../../../core/utils/end_points.dart';

class SearchRepo {
  Future<Either<String, ListOfMarketsModel>> getLocationForSearch(
      double mapLate,
      double mapLong,
      int gid,
      int cid,
      int aid,
      int cateId) async {
    final response =
        await DioHelper.get(EndPoints.endpointSearchStores, headers: {
      'MapLate': "31.373292",
      'MapLong': "31.027256",
      'GID': gid,
      'CID': cid,
      'AID': aid,
      'Cate': cateId,
    });
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success SearchStoresRepo");
        return Right(
            ListOfMarketsModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .error
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, StoreCategoriesModel>> getStoreCategories() async {
    final response = await DioHelper.get(EndPoints.endpointStoreCates);
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success StoreCategoriesRepo");
        return Right(
            StoreCategoriesModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .error
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, StoreMainCategoriesModel>> getStoreMainCategories(
      int storeId) async {
    final response =
        await DioHelper.get(EndPoints.endpointStoreMainCates, headers: {
      "store": storeId,
    });
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success StoreMainCatesRepo");
        return Right(
            StoreMainCategoriesModel.fromJson(jsonDecode(response.toString())));
      } else {
        return Left(ErrorModel.fromJson(jsonDecode(response.toString()))
            .error
            .toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, MarketProductsModel>> getMarketProducts(
      int mainCateId, int subCateId, int storeId, bool offer) async {
    final response =
        await DioHelper.get(EndPoints.endpointMarketProducts, headers: {
      "MainCate": mainCateId,
      "SubCate": offer ? 0 : subCateId,
      "Store": storeId,
      "offer": offer ? 1 : 0,
    });
    try {
      if (response.statusCode == 200 && response.data['status'] == 'success') {
        log("Success MarketProductsRepo");
        return Right(
            MarketProductsModel.fromJson(jsonDecode(response.toString())));
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
