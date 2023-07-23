// To parse this JSON data, do
//
//     final acceptOrdersModel = acceptOrdersModelFromJson(jsonString);

import 'dart:convert';

AcceptOrdersModel acceptOrdersModelFromJson(String str) =>
    AcceptOrdersModel.fromJson(json.decode(str));

String acceptOrdersModelToJson(AcceptOrdersModel data) =>
    json.encode(data.toJson());

class AcceptOrdersModel {
  String status;
  String data;

  AcceptOrdersModel({
    required this.status,
    required this.data,
  });

  factory AcceptOrdersModel.fromJson(Map<String, dynamic> json) =>
      AcceptOrdersModel(
        status: json["status"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data,
      };
}
