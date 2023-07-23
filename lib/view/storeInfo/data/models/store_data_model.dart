// To parse this JSON data, do
//
//     final storeDataModel = storeDataModelFromJson(jsonString);

import 'dart:convert';

StoreDataModel storeDataModelFromJson(String str) =>
    StoreDataModel.fromJson(json.decode(str));

String storeDataModelToJson(StoreDataModel data) => json.encode(data.toJson());

class StoreDataModel {
  String status;
  StoreData data;

  StoreDataModel({
    required this.status,
    required this.data,
  });

  factory StoreDataModel.fromJson(Map<String, dynamic> json) => StoreDataModel(
        status: json["status"],
        data: StoreData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class StoreData {
  int id;
  String name;
  String? photo;
  String cover;
  dynamic temporaryCover;
  dynamic des;
  int gid;
  int cid;
  int aid;
  int cateId;
  int ownerId;
  dynamic location;
  dynamic locationDescription;
  dynamic phone;
  dynamic whatsapp;
  dynamic mapLate;
  dynamic mapLong;
  String status;
  String onOff;
  dynamic delevery;
  dynamic minimunCharge;
  String coveredAreas;
  String workFrom;
  String workTo;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic rate;

  StoreData({
    required this.id,
    required this.name,
    required this.photo,
    required this.cover,
    this.temporaryCover,
    required this.des,
    required this.gid,
    required this.cid,
    required this.aid,
    required this.cateId,
    required this.ownerId,
    this.location,
    required this.locationDescription,
    this.phone,
    this.whatsapp,
    this.mapLate,
    this.mapLong,
    required this.status,
    required this.onOff,
    this.delevery,
    this.minimunCharge,
    required this.coveredAreas,
    required this.workFrom,
    required this.workTo,
    required this.createdAt,
    required this.updatedAt,
    this.rate,
  });

  factory StoreData.fromJson(Map<String, dynamic> json) => StoreData(
        id: json["id"],
        name: json["name"],
        photo: json["photo"],
        cover: json["cover"],
        temporaryCover: json["TemporaryCover"],
        des: json["Des"],
        gid: json["GID"],
        cid: json["CID"],
        aid: json["AID"],
        cateId: json["Cate_id"],
        ownerId: json["Owner_id"],
        location: json["location"],
        locationDescription: json["LocationDescription"],
        phone: json["phone"],
        whatsapp: json["whatsapp"],
        mapLate: json["MapLate"],
        mapLong: json["MapLong"],
        status: json["Status"],
        onOff: json["OnOff"],
        delevery: json["Delevery"],
        minimunCharge: json["minimunCharge"],
        coveredAreas: json["CoveredAreas"],
        workFrom: json["WorkFrom"],
        workTo: json["WorkTo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo": photo,
        "cover": cover,
        "TemporaryCover": temporaryCover,
        "Des": des,
        "GID": gid,
        "CID": cid,
        "AID": aid,
        "Cate_id": cateId,
        "Owner_id": ownerId,
        "location": location,
        "LocationDescription": locationDescription,
        "phone": phone,
        "whatsapp": whatsapp,
        "MapLate": mapLate,
        "MapLong": mapLong,
        "Status": status,
        "OnOff": onOff,
        "Delevery": delevery,
        "minimunCharge": minimunCharge,
        "CoveredAreas": coveredAreas,
        "WorkFrom": workFrom,
        "WorkTo": workTo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "rate": rate,
      };
}
