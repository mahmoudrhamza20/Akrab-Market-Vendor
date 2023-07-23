class ListOfMarketsModel {
  String? status;
  List<ListOfMarketsData>? data;

  ListOfMarketsModel({this.status, this.data});

  ListOfMarketsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ListOfMarketsData>[];
      json['data'].forEach((v) {
        data!.add(ListOfMarketsData.fromJson(v));
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

class ListOfMarketsData {
  int? id;
  String? name;
  String? photo;
  String? cover;
  String? des;
  Category? category;
  OwnerId? ownerId;
  String? location;
  String? locationDescription;
  String? phone;
  String? whatsapp;
  String? mapLate;
  String? mapLong;
  String? onOff;
  String? delevery;
  String? minimunCharge;
  String? workFrom;
  String? workTo;
  List<Comments>? comments;
  int? rate;

  ListOfMarketsData(
      {this.id,
      this.name,
      this.photo,
      this.cover,
      this.des,
      this.category,
      this.ownerId,
      this.location,
      this.locationDescription,
      this.phone,
      this.whatsapp,
      this.mapLate,
      this.mapLong,
      this.onOff,
      this.delevery,
      this.minimunCharge,
      this.workFrom,
      this.workTo,
      this.comments,
      this.rate});

  ListOfMarketsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    cover = json['cover'];
    des = json['Des'];
    category =
        json['Category'] != null ? Category.fromJson(json['Category']) : null;
    ownerId =
        json['Owner_id'] != null ? OwnerId.fromJson(json['Owner_id']) : null;
    location = json['location'];
    locationDescription = json['LocationDescription'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    mapLate = json['MapLate'];
    mapLong = json['MapLong'];
    onOff = json['OnOff'];
    delevery = json['Delevery'];
    minimunCharge = json['minimunCharge'];
    workFrom = json['WorkFrom'];
    workTo = json['WorkTo'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['photo'] = photo;
    data['cover'] = cover;
    data['Des'] = des;
    if (category != null) {
      data['Category'] = category!.toJson();
    }
    if (ownerId != null) {
      data['Owner_id'] = ownerId!.toJson();
    }
    data['location'] = location;
    data['LocationDescription'] = locationDescription;
    data['phone'] = phone;
    data['whatsapp'] = whatsapp;
    data['MapLate'] = mapLate;
    data['MapLong'] = mapLong;
    data['OnOff'] = onOff;
    data['Delevery'] = delevery;
    data['minimunCharge'] = minimunCharge;
    data['WorkFrom'] = workFrom;
    data['WorkTo'] = workTo;
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    data['rate'] = rate;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  int? ordered;
  String? createdAt;
  String? updatedAt;

  Category({this.id, this.name, this.ordered, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ordered = json['ordered'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['ordered'] = ordered;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class OwnerId {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? whatsAPP;
  String? emailVerifiedAt;
  String? photo;
  int? provianceID;
  int? cityID;
  int? areaID;
  // void mapLong;
  // void mapLat;
  int? activationCode;
  int? verified;
  int? storeID;
  String? deviceToken;
  String? createdAt;
  String? updatedAt;

  OwnerId(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.whatsAPP,
      this.emailVerifiedAt,
      this.photo,
      this.provianceID,
      this.cityID,
      this.areaID,
      // this.mapLong,
      // this.mapLat,
      this.activationCode,
      this.verified,
      this.storeID,
      this.deviceToken,
      this.createdAt,
      this.updatedAt});

  OwnerId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    whatsAPP = json['WhatsAPP'];
    emailVerifiedAt = json['email_verified_at'];
    photo = json['photo'];
    provianceID = json['ProvianceID'];
    cityID = json['CityID'];
    areaID = json['AreaID'];
    // mapLong = json['mapLong'];
    // mapLat = json['mapLat'];
    activationCode = json['ActivationCode'];
    verified = json['verified'];
    storeID = json['StoreID'];
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
    data['ProvianceID'] = provianceID;
    data['CityID'] = cityID;
    data['AreaID'] = areaID;
    // data['mapLong'] = mapLong;
    // data['mapLat'] = mapLat;
    data['ActivationCode'] = activationCode;
    data['verified'] = verified;
    data['StoreID'] = storeID;
    data['DeviceToken'] = deviceToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Comments {
  int? id;
  String? rate;
  String? date;
  String? comment;
  Client? client;

  Comments({this.id, this.rate, this.date, this.comment, this.client});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['Rate'];
    comment = json['Comment'];
    date = json['date'];
    client = json['client'] != null ? Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Rate'] = rate;
    data['Comment'] = comment;
    data['date'] = rate;
    if (client != null) {
      data['client'] = client!.toJson();
    }
    return data;
  }
}

class Client {
  int? id;
  String? name;
  String? photo;
  String? email;

  Client({this.id, this.name, this.photo, this.email});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['photo'] = photo;
    data['email'] = email;
    return data;
  }
}
