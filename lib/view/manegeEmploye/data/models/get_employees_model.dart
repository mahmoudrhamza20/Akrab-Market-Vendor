// To parse this JSON data, do
//
//     final getEmployeesModel = getEmployeesModelFromJson(jsonString);

import 'dart:convert';

GetEmployeesModel getEmployeesModelFromJson(String str) =>
    GetEmployeesModel.fromJson(json.decode(str));

String getEmployeesModelToJson(GetEmployeesModel data) =>
    json.encode(data.toJson());

class GetEmployeesModel {
  String status;
  List<GetEmployeesData> data;

  GetEmployeesModel({
    required this.status,
    required this.data,
  });

  factory GetEmployeesModel.fromJson(Map<String, dynamic> json) =>
      GetEmployeesModel(
        status: json["status"],
        data: List<GetEmployeesData>.from(
            json["data"].map((x) => GetEmployeesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GetEmployeesData {
  int userId;
  String userName;
  dynamic photo;
  String userTitle;

  GetEmployeesData({
    required this.userId,
    required this.userName,
    this.photo,
    required this.userTitle,
  });

  factory GetEmployeesData.fromJson(Map<String, dynamic> json) =>
      GetEmployeesData(
        userId: json["UserID"],
        userName: json["UserName"],
        photo: json["photo"],
        userTitle: json["UserTitle"],
      );

  Map<String, dynamic> toJson() => {
        "UserID": userId,
        "UserName": userName,
        "photo": photo,
        "UserTitle": userTitle,
      };
}
