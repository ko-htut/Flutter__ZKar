// To parse this JSON data, do
//
//     final season = seasonFromJson(jsonString);

import 'dart:convert';

Season seasonFromJson(String str) => Season.fromJson(json.decode(str));

String seasonToJson(Season data) => json.encode(data.toJson());

class Season {
    List<Datum> data;

    Season({
        this.data,
    });

    factory Season.fromJson(Map<String, dynamic> json) => Season(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String name;
    String originalName;

    Datum({
        this.id,
        this.name,
        this.originalName,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        originalName: json["original_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "original_name": originalName,
    };
}
