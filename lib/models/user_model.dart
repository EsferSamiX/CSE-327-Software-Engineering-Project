import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String? accessToken;
  final Data? data;
  final String? msg;

  UserModel({
    this.accessToken,
    this.data,
    this.msg,
  });

  UserModel copyWith({
    String? accessToken,
    Data? data,
    String? msg,
  }) =>
      UserModel(
        accessToken: accessToken ?? this.accessToken,
        data: data ?? this.data,
        msg: msg ?? this.msg,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json["access_token"],
        data: Data.fromJson(json["data"]),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "data": data!.toJson(),
        "msg": msg,
      };
}

class Data {
  final String? city;
  final String? email;
  final String? fname;
  final int? id;
  final String? lname;
  final String? phone;
  final String? userModelname;

  Data({
    this.city,
    this.email,
    this.fname,
    this.id,
    this.lname,
    this.phone,
    this.userModelname,
  });

  Data copyWith({
    String? city,
    String? email,
    String? fname,
    int? id,
    String? lname,
    String? phone,
    String? userModelname,
  }) =>
      Data(
        city: city ?? this.city,
        email: email ?? this.email,
        fname: fname ?? this.fname,
        id: id ?? this.id,
        lname: lname ?? this.lname,
        phone: phone ?? this.phone,
        userModelname: userModelname ?? this.userModelname,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        city: json["city"],
        email: json["email"],
        fname: json["fname"],
        id: json["id"],
        lname: json["lname"],
        phone: json["phone"],
        userModelname: json["userModelname"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "email": email,
        "fname": fname,
        "id": id,
        "lname": lname,
        "phone": phone,
        "userModelname": userModelname,
      };
}


// {
// 	"access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTcxNTk3MjYwNSwianRpIjoiY2VhYjA1ZTktYmJmOC00ZTMxLWJiOWUtMjczMmZlNzhkNzJjIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6IjAxMjQ2NTQ4NTQiLCJuYmYiOjE3MTU5NzI2MDUsImNzcmYiOiI0M2M4ZTRjYS1iNzU3LTRjZmEtYWRmOC1kM2EyZDM4MTRmNWIiLCJleHAiOjE3MTU5NzM1MDV9.DIDTjQ7Vm0yPp6mBf_XoqQ6FRFmEkgUM1QyKG_yCdRw",
// 	"data": {
// 		"city": "Dhaka",
// 		"email": "tempssssmail@mail.com",
// 		"fname": "Newaz",
// 		"id": 8,
// 		"lname": "ben",
// 		"phone": 124654854,
// 		"username": "ssssssss"
// 	},
// 	"msg": "success"
// }