// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) =>
    OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) =>
    json.encode(data.toJson());

class OrderDetailsModel {
  String status;
  OrderData data;
  List<OrderItem> items;

  OrderDetailsModel({
    required this.status,
    required this.data,
    required this.items,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        status: json["status"],
        data: OrderData.fromJson(json["data"]),
        items: List<OrderItem>.from(
            json["Items"].map((x) => OrderItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "Items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class OrderData {
  int orderId;
  String clientName;
  String area;
  String delevery;
  String destance;
  int itemsNo;
  String totalPrice;
  String status;
  dynamic addressId;
  String employee;

  OrderData({
    required this.orderId,
    required this.clientName,
    required this.area,
    required this.delevery,
    required this.destance,
    required this.itemsNo,
    required this.totalPrice,
    required this.status,
    this.addressId,
    required this.employee,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        orderId: json["OrderID"],
        clientName: json["ClientName"],
        area: json["Area"],
        delevery: json["Delevery"],
        destance: json["Destance"],
        itemsNo: json["ItemsNo"],
        totalPrice: json["TotalPrice"],
        status: json["Status"],
        addressId: json["AddressID"],
        employee: json["Employee"],
      );

  Map<String, dynamic> toJson() => {
        "OrderID": orderId,
        "ClientName": clientName,
        "Area": area,
        "Delevery": delevery,
        "Destance": destance,
        "ItemsNo": itemsNo,
        "TotalPrice": totalPrice,
        "Status": status,
        "AddressID": addressId,
        "Employee": employee,
      };
}

class OrderItem {
  int id;
  String marketId;
  String clientId;
  String marketProductId;
  String productId;
  String orderId;
  dynamic offerId;
  String sizeDetails;
  String price;
  String quantity;
  DateTime createdAt;
  DateTime updatedAt;
  String productName;
  int thisTotal;

  OrderItem({
    required this.id,
    required this.marketId,
    required this.clientId,
    required this.marketProductId,
    required this.productId,
    required this.orderId,
    this.offerId,
    required this.sizeDetails,
    required this.price,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.productName,
    required this.thisTotal,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        marketId: json["MarketID"],
        clientId: json["ClientID"],
        marketProductId: json["MarketProductID"],
        productId: json["ProductID"],
        orderId: json["OrderID"],
        offerId: json["OfferID"],
        sizeDetails: json["SizeDetails"],
        price: json["Price"],
        quantity: json["Quantity"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        productName: json["ProductName"],
        thisTotal: json["ThisTotal"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "MarketID": marketId,
        "ClientID": clientId,
        "MarketProductID": marketProductId,
        "ProductID": productId,
        "OrderID": orderId,
        "OfferID": offerId,
        "SizeDetails": sizeDetails,
        "Price": price,
        "Quantity": quantity,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "ProductName": productName,
        "ThisTotal": thisTotal,
      };
}
