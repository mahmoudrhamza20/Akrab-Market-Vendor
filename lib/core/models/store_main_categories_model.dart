import 'categories_model.dart';

class StoreMainCategoriesModel {
  String? status;
  List<Categories>? data;

  StoreMainCategoriesModel({this.status, this.data});

  StoreMainCategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Categories>[];
      json['data'].forEach((v) {
        data!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
