// To parse this JSON data, do
//
//     final storeCategoriesModel = storeCategoriesModelFromJson(jsonString);

import 'dart:convert';

StoreCategoriesModel storeCategoriesModelFromJson(String str) {
  final jsonData = json.decode(str);
  return StoreCategoriesModel.fromJson(jsonData);
}

String storeCategoriesModelToJson(StoreCategoriesModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class StoreCategoriesModel {
  String? status;
  late List<StoreCategoriesData> data;

  StoreCategoriesModel({
    this.status,
    required this.data,
  });

  factory StoreCategoriesModel.fromJson(Map<String, dynamic> json) =>
      StoreCategoriesModel(
        status: json["status"],
        data: List<StoreCategoriesData>.from(
            json["data"].map((x) => StoreCategoriesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class StoreCategoriesData {
  int? id;
  String? name;

  StoreCategoriesData({
    this.id,
    this.name,
  });

  factory StoreCategoriesData.fromJson(Map<String, dynamic> json) =>
      StoreCategoriesData(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
