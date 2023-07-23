class Categories {
  int? id;
  String? name;
  String? photo;
  int? mainCate;
  int? storeCate;
  int? ordered;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.id,
      this.name,
      this.photo,
      this.mainCate,
      this.storeCate,
      this.ordered,
      this.createdAt,
      this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['Photo'];
    mainCate = json['MainCate'];
    storeCate = json['StoreCate'];
    ordered = json['ordered'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['Photo'] = photo;
    data['MainCate'] = mainCate;
    data['StoreCate'] = storeCate;
    data['ordered'] = ordered;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
