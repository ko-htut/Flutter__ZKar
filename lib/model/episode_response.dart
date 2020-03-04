// To parse this JSON data, do
//
//     final episodeResponse = episodeResponseFromJson(jsonString);

import 'dart:convert';

EpisodeResponse episodeResponseFromJson(String str) => EpisodeResponse.fromJson(json.decode(str));

String episodeResponseToJson(EpisodeResponse data) => json.encode(data.toJson());

class EpisodeResponse {
    List<Datum> data;

    EpisodeResponse({
        this.data,
    });

    factory EpisodeResponse.fromJson(Map<String, dynamic> json) => EpisodeResponse(
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
    String runtime;
    String size;
    int points;
    int viewCount;
    int downloadCount;
    bool bought;

    Datum({
        this.id,
        this.name,
        this.originalName,
        this.runtime,
        this.size,
        this.points,
        this.viewCount,
        this.downloadCount,
        this.bought,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        originalName: json["original_name"],
        runtime: json["runtime"],
        size: json["size"],
        points: json["points"],
        viewCount: json["view_count"],
        downloadCount: json["download_count"],
        bought: json["bought"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "original_name": originalName,
        "runtime": runtime,
        "size": size,
        "points": points,
        "view_count": viewCount,
        "download_count": downloadCount,
        "bought": bought,
    };
}

