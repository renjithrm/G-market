// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  ProductDetailsModel({
    this.product,
    this.store,
  });

  Product? product;
  Store? store;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        store: json["store"] == null ? null : Store.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "product": product == null ? null : product!.toJson(),
        "store": store == null ? null : store!.toJson(),
      };
}

class Product {
  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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

class Store {
  Store({
    this.id,
    this.firstname,
    this.lastname,
    this.storename,
    this.city,
    this.address,
    this.email,
    this.phoneno,
    this.password,
    this.v,
    this.logo,
  });

  String? id;
  String? firstname;
  String? lastname;
  String? storename;
  String? city;
  String? address;
  String? email;
  String? phoneno;
  String? password;
  int? v;
  String? logo;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["_id"] == null ? null : json["_id"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        storename: json["storename"] == null ? null : json["storename"],
        city: json["city"] == null ? null : json["city"],
        address: json["address"] == null ? null : json["address"],
        email: json["email"] == null ? null : json["email"],
        phoneno: json["phoneno"] == null ? null : json["phoneno"],
        password: json["password"] == null ? null : json["password"],
        v: json["__v"] == null ? null : json["__v"],
        logo: json["logo"] == null ? null : json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "storename": storename == null ? null : storename,
        "city": city == null ? null : city,
        "address": address == null ? null : address,
        "email": email == null ? null : email,
        "phoneno": phoneno == null ? null : phoneno,
        "password": password == null ? null : password,
        "__v": v == null ? null : v,
        "logo": logo == null ? null : logo,
      };
}
