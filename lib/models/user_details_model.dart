// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

UserDetails userDetailsFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  UserDetails({
    this.id,
    this.username,
    this.email,
    this.phoneno,
    this.password,
    this.v,
  });

  String? id;
  String? username;
  String? email;
  int? phoneno;
  String? password;
  int? v;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["_id"] == null ? null : json["_id"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        phoneno: json["phoneno"] == null ? null : json["phoneno"],
        password: json["password"] == null ? null : json["password"],
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "phoneno": phoneno == null ? null : phoneno,
        "password": password == null ? null : password,
        "__v": v == null ? null : v,
      };
}
