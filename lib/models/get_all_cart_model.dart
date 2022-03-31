// To parse this JSON data, do
//
//     final getAllCartProducts = getAllCartProductsFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

List<GetAllCartProducts> getAllCartProductsFromJson(String str) =>
    List<GetAllCartProducts>.from(
        json.decode(str).map((x) => GetAllCartProducts.fromJson(x)));

String getAllCartProductsToJson(List<GetAllCartProducts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllCartProducts {
  GetAllCartProducts({
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

  factory GetAllCartProducts.fromJson(Map<String, dynamic> json) =>
      GetAllCartProducts(
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
