// To parse this JSON data, do
//
//     final addEmployeeModel = addEmployeeModelFromJson(jsonString);

import 'dart:convert';

AddEmployeeModel addEmployeeModelFromJson(String str) =>
    AddEmployeeModel.fromJson(json.decode(str));

String addEmployeeModelToJson(AddEmployeeModel data) =>
    json.encode(data.toJson());

class AddEmployeeModel {
  String status;
  AddEmployeeModelData data;

  AddEmployeeModel({
    required this.status,
    required this.data,
  });

  factory AddEmployeeModel.fromJson(Map<String, dynamic> json) =>
      AddEmployeeModel(
        status: json["status"],
        data: AddEmployeeModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class AddEmployeeModelData {
  String storeId;
  String verified;
  int activationCode;
  String name;
  String email;
  String phone;
  dynamic provianceId;
  dynamic cityId;
  dynamic areaId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  AddEmployeeModelData({
    required this.storeId,
    required this.verified,
    required this.activationCode,
    required this.name,
    required this.email,
    required this.phone,
    this.provianceId,
    this.cityId,
    this.areaId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory AddEmployeeModelData.fromJson(Map<String, dynamic> json) =>
      AddEmployeeModelData(
        storeId: json["StoreID"],
        verified: json["verified"],
        activationCode: json["ActivationCode"],
        name: json["name"],
        email: json["email"],
        phone: json["Phone"],
        provianceId: json["ProvianceID"],
        cityId: json["CityID"],
        areaId: json["AreaID"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "StoreID": storeId,
        "verified": verified,
        "ActivationCode": activationCode,
        "name": name,
        "email": email,
        "Phone": phone,
        "ProvianceID": provianceId,
        "CityID": cityId,
        "AreaID": areaId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
