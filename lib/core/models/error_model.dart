class ErrorModel {
  String? status;
  String? error;

  ErrorModel({this.status, this.error});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['error'] = error;
    return data;
  }
}
