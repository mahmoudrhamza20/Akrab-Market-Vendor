class ProductDetailsModel {
  int? marketProductId;
  int? originalProductId;
  String? name;
  String? description;
  String? photo;
  List<Sizes>? sizes;
  Sizes? defaultSize;

  ProductDetailsModel(
      {this.marketProductId,
      this.originalProductId,
      this.name,
      this.description,
      this.photo,
      this.sizes,
      this.defaultSize});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    marketProductId = json['market_product_id'];
    originalProductId = json['original_product_id'];
    name = json['name'];
    description = json['description'];
    photo = json['photo'];
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(Sizes.fromJson(v));
      });
    }
    defaultSize = json['default_size'] != null
        ? Sizes.fromJson(json['default_size'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['market_product_id'] = marketProductId;
    data['original_product_id'] = originalProductId;
    data['name'] = name;
    data['description'] = description;
    data['photo'] = photo;
    if (sizes != null) {
      data['sizes'] = sizes!.map((v) => v.toJson()).toList();
    }
    if (defaultSize != null) {
      data['default_size'] = defaultSize!.toJson();
    }
    return data;
  }
}

class Sizes {
  String? photo;
  String? size;
  String? price;
  String? quantity;
  String? offer;
  String? offerDate;

  Sizes(
      {this.photo,
      this.size,
      this.price,
      this.quantity,
      this.offer,
      this.offerDate});

  Sizes.fromJson(Map<String, dynamic> json) {
    photo = json['Photo'];
    size = json['Size'];
    price = json['Price'];
    quantity = json['Quantity'];
    offer = json['Offer'];
    offerDate = json['OfferDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Photo'] = photo;
    data['Size'] = size;
    data['Price'] = price;
    data['Quantity'] = quantity;
    data['Offer'] = offer;
    data['OfferDate'] = offerDate;
    return data;
  }
}
