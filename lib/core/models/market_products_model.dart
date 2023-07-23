import 'package:akrab_market_vendor/core/models/product_details_model.dart';

import 'categories_model.dart';

class MarketProductsModel {
  String? status;
  List<Categories>? subCategories;
  List<ProductDetailsModel>? marketProducts;

  MarketProductsModel({this.status, this.subCategories, this.marketProducts});

  MarketProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['SubCategories'] != null) {
      subCategories = <Categories>[];
      json['SubCategories'].forEach((v) {
        subCategories!.add(Categories.fromJson(v));
      });
    }
    if (json['MarketProducts'] != null) {
      marketProducts = <ProductDetailsModel>[];
      json['MarketProducts'].forEach((v) {
        marketProducts!.add(ProductDetailsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (subCategories != null) {
      data['SubCategories'] = subCategories!.map((v) => v.toJson()).toList();
    }
    if (marketProducts != null) {
      data['MarketProducts'] = marketProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
