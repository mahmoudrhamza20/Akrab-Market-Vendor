// To parse this JSON data, do
//
//     final deleteEmployeesModel = deleteEmployeesModelFromJson(jsonString);

import 'dart:convert';

DeleteEmployeesModel deleteEmployeesModelFromJson(String str) =>
    DeleteEmployeesModel.fromJson(json.decode(str));

String deleteEmployeesModelToJson(DeleteEmployeesModel data) =>
    json.encode(data.toJson());

class DeleteEmployeesModel {
  String status;
  String data;

  DeleteEmployeesModel({
    required this.status,
    required this.data,
  });

  factory DeleteEmployeesModel.fromJson(Map<String, dynamic> json) =>
      DeleteEmployeesModel(
        status: json["status"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data,
      };
}
