class FAQsModel {
  List<FAQsData>? data;

  FAQsModel({this.data});

  FAQsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FAQsData>[];
      json['data'].forEach((v) {
        data!.add(FAQsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FAQsData {
  int? id;
  String? question;
  String? answer;

  FAQsData({this.id, this.question, this.answer});

  FAQsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }
}
