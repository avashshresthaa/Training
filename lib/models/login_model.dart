// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  Result? result;
  String? token;

  LoginModel({
    this.result,
    this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "token": token,
      };
}

class Result {
  String? id;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phone;
  String? location;
  bool? verified;
  int? v;

  Result({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.location,
    this.verified,
    this.v,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        name: json["name"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        location: json["location"],
        verified: json["verified"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "phone": phone,
        "location": location,
        "verified": verified,
        "__v": v,
      };
}
