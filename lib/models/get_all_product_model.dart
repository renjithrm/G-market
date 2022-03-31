// To parse this JSON data, do
//
//     final getAllProductModel = getAllProductModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

List<GetAllProductModel> getAllProductModelFromJson(String str) =>
    List<GetAllProductModel>.from(
        json.decode(str).map((x) => GetAllProductModel.fromJson(x)));

String getAllProductModelToJson(List<GetAllProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllProductModel {
  GetAllProductModel({
    this.id,
    this.storeid,
    this.productname,
    this.unit,
    this.qty,
    this.amount,
    this.exprmonths,
    this.category,
    this.units,
    this.description,
    this.v,
    this.image1,
    this.image2,
    this.image3,
  });

  String? id;
  String? storeid;
  String? productname;
  String? unit;
  int? qty;
  int? amount;
  int? exprmonths;
  String? category;
  int? units;
  String? description;
  int? v;
  String? image1;
  String? image2;
  String? image3;

  factory GetAllProductModel.fromJson(Map<String, dynamic> json) =>
      GetAllProductModel(
        id: json["_id"] == null ? null : json["_id"],
        storeid: json["storeid"] == null ? null : json["storeid"],
        productname: json["productname"] == null ? null : json["productname"],
        unit: json["unit"] == null ? null : json["unit"],
        qty: json["qty"] == null ? null : json["qty"],
        amount: json["amount"] == null ? null : json["amount"],
        exprmonths: json["exprmonths"] == null ? null : json["exprmonths"],
        category: json["category"] == null ? null : json["category"],
        units: json["units"] == null ? null : json["units"],
        description: json["description"] == null ? null : json["description"],
        v: json["__v"] == null ? null : json["__v"],
        image1: json["image1"] == null ? null : json["image1"],
        image2: json["image2"] == null ? null : json["image2"],
        image3: json["image3"] == null ? null : json["image3"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "storeid": storeid == null ? null : storeid,
        "productname": productname == null ? null : productname,
        "unit": unit == null ? null : unit,
        "qty": qty == null ? null : qty,
        "amount": amount == null ? null : amount,
        "exprmonths": exprmonths == null ? null : exprmonths,
        "category": category == null ? null : category,
        "units": units == null ? null : units,
        "description": description == null ? null : description,
        "__v": v == null ? null : v,
        "image1": image1 == null ? null : image1,
        "image2": image2 == null ? null : image2,
        "image3": image3 == null ? null : image3,
      };
}
