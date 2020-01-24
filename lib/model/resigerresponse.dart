import 'dart:convert';

Registerresponse registerresponseFromJson(String str) =>
    Registerresponse.fromJson(json.decode(str));

String registerresponseToJson(Registerresponse data) =>
    json.encode(data.toJson());

class Registerresponse {
  bool status;
  Data data;

  Registerresponse({
    this.status,
    this.data,
  });

  factory Registerresponse.fromJson(Map<String, dynamic> json) =>
      Registerresponse(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  String name;
  String email;
  dynamic profile;
  int points;
  String token;

  Data({
    this.name,
    this.email,
    this.profile,
    this.points,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        profile: json["profile"],
        points: json["points"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "profile": profile,
        "points": points,
        "token": token,
      };
}
