class GeneralDataModel {
  String? status;
  List<GeneralDataData>? data;

  GeneralDataModel({this.status, this.data});

  GeneralDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <GeneralDataData>[];
      json['data'].forEach((v) {
        data!.add(GeneralDataData.fromJson(v));
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

class GeneralDataData {
  String? key;
  String? value;

  GeneralDataData({this.key, this.value});

  GeneralDataData.fromJson(Map<String, dynamic> json) {
    key = json['Key'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Key'] = key;
    data['Value'] = value;
    return data;
  }
}
