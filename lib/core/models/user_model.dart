class UserModel {
  String? status;
  UserData? data;

  UserModel({this.status, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? whatsAPP;
  String? emailVerifiedAt;
  String? photo;
  ProvianceID? provianceID;
  ProvianceID? cityID;
  ProvianceID? areaID;
  String? mapLong;
  String? mapLat;
  int? activationCode;
  String? deviceToken;
  String? createdAt;
  String? updatedAt;

  UserData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.whatsAPP,
    this.emailVerifiedAt,
    this.photo,
    this.provianceID,
    this.cityID,
    this.areaID,
    this.mapLong,
    this.mapLat,
    this.activationCode,
    this.deviceToken,
    this.createdAt,
    this.updatedAt,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    whatsAPP = json['WhatsAPP'];
    emailVerifiedAt = json['email_verified_at'];
    photo = json['photo'];
    provianceID = json['ProvianceID'] != null
        ? ProvianceID.fromJson(json['ProvianceID'])
        : null;
    cityID =
        json['CityID'] != null ? ProvianceID.fromJson(json['CityID']) : null;
    areaID =
        json['AreaID'] != null ? ProvianceID.fromJson(json['AreaID']) : null;
    mapLong = json['mapLong'];
    mapLat = json['mapLat'];
    activationCode = json['ActivationCode'];
    deviceToken = json['DeviceToken'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['WhatsAPP'] = whatsAPP;
    data['email_verified_at'] = emailVerifiedAt;
    data['photo'] = photo;
    if (provianceID != null) {
      data['ProvianceID'] = provianceID!.toJson();
    }
    if (cityID != null) {
      data['CityID'] = cityID!.toJson();
    }
    if (areaID != null) {
      data['AreaID'] = areaID!.toJson();
    }
    data['mapLong'] = mapLong;
    data['mapLat'] = mapLat;
    data['ActivationCode'] = activationCode;
    data['DeviceToken'] = deviceToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ProvianceID {
  int? id;
  String? name;

  ProvianceID({this.id, this.name});

  ProvianceID.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
