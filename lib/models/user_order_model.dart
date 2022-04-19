// To parse this JSON data, do
//
//     final userProductOrder = userProductOrderFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

List<UserProductOrder> userProductOrderFromJson(String str) =>
    List<UserProductOrder>.from(
        json.decode(str).map((x) => UserProductOrder.fromJson(x)));

String userProductOrderToJson(List<UserProductOrder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserProductOrder {
  UserProductOrder({
    this.id,
    this.userid,
    this.storeid,
    this.products,
    this.totalamount,
    this.address,
    this.status,
    this.paymentid,
    this.v,
  });

  String? id;
  String? userid;
  String? storeid;
  List<Product>? products;
  int? totalamount;
  String? address;
  String? status;
  String? paymentid;
  int? v;

  factory UserProductOrder.fromJson(Map<String, dynamic> json) =>
      UserProductOrder(
        id: json["_id"] == null ? null : json["_id"],
        userid: json["userid"] == null ? null : json["userid"],
        storeid: json["storeid"] == null ? null : json["storeid"],
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
        totalamount: json["totalamount"] == null ? null : json["totalamount"],
        address: json["address"] == null ? null : json["address"],
        status: json["status"] == null ? null : json["status"],
        paymentid: json["paymentid"] == null ? null : json["paymentid"],
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "userid": userid == null ? null : userid,
        "storeid": storeid == null ? null : storeid,
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "totalamount": totalamount == null ? null : totalamount,
        "address": address == null ? null : address,
        "status": status == null ? null : status,
        "paymentid": paymentid == null ? null : paymentid,
        "__v": v == null ? null : v,
      };
}

class Product {
  Product({
    this.productid,
    this.productname,
    this.qty,
    this.unit,
    this.noofitems,
    this.producttotal,
    this.image,
    this.id,
  });

  String? productid;
  String? productname;
  int? qty;
  String? unit;
  int? noofitems;
  int? producttotal;
  String? image;
  String? id;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productid: json["productid"] == null ? null : json["productid"],
        productname: json["productname"] == null ? null : json["productname"],
        qty: json["qty"] == null ? null : json["qty"],
        unit: json["unit"] == null ? null : json["unit"],
        noofitems: json["noofitems"] == null ? null : json["noofitems"],
        producttotal:
            json["producttotal"] == null ? null : json["producttotal"],
        image: json["image"] == null ? null : json["image"],
        id: json["_id"] == null ? null : json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "productid": productid == null ? null : productid,
        "productname": productname == null ? null : productname,
        "qty": qty == null ? null : qty,
        "unit": unit == null ? null : unit,
        "noofitems": noofitems == null ? null : noofitems,
        "producttotal": producttotal == null ? null : producttotal,
        "image": image == null ? null : image,
        "_id": id == null ? null : id,
      };
}
