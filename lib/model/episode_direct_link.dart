// To parse this JSON data, do
//
//     final episodeDirectlink = episodeDirectlinkFromJson(jsonString);

import 'dart:convert';

EpisodeDirectlink episodeDirectlinkFromJson(String str) => EpisodeDirectlink.fromJson(json.decode(str));

String episodeDirectlinkToJson(EpisodeDirectlink data) => json.encode(data.toJson());

class EpisodeDirectlink {
    List<Datum> data;

    EpisodeDirectlink({
        this.data,
    });

    factory EpisodeDirectlink.fromJson(Map<String, dynamic> json) => EpisodeDirectlink(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String link;
    dynamic size;
    String quality;

    Datum({
        this.link,
        this.size,
        this.quality,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        link: json["link"],
        size: json["size"],
        quality: json["quality"],
    );

    Map<String, dynamic> toJson() => {
        "link": link,
        "size": size,
        "quality": quality,
    };
}
