class GetAreaModel {
  String? status;
  late List<Governorate> governorate;

  GetAreaModel({this.status, required this.governorate});

  GetAreaModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      governorate = <Governorate>[];
      json['data'].forEach((v) {
        governorate.add(Governorate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = governorate.map((v) => v.toJson()).toList();
    return data;
  }
}

class Governorate {
  int? id;
  String? name;
  List<Cities>? cities;

  Governorate({this.id, this.name, this.cities});

  Governorate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['Cities'] != null) {
      cities = <Cities>[];
      json['Cities'].forEach((v) {
        cities!.add(Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (cities != null) {
      data['Cities'] = cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  int? id;
  String? name;
  late List<Areas> areas;

  Cities({this.id, this.name, required this.areas});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['Areas'] != null) {
      areas = <Areas>[];
      json['Areas'].forEach((v) {
        areas.add(Areas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['Areas'] = areas.map((v) => v.toJson()).toList();
    return data;
  }
}

class Areas {
  int? id;
  String? name;

  Areas({this.id, this.name});

  Areas.fromJson(Map<String, dynamic> json) {
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
