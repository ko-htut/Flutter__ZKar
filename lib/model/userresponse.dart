import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));
String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
    String name;
    String email;
    int points;
    dynamic profile;

    UserData({
        this.name,
        this.email,
        this.points,
        this.profile,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        name: json["name"],
        email: json["email"],
        points: json["points"],
        profile: json["profile"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "points": points,
        "profile": profile,
    };
}
