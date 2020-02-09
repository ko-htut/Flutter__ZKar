// To parse this JSON data, do
//
//     final movieDirectLink = movieDirectLinkFromJson(jsonString);

import 'dart:convert';

MovieDirectLink movieDirectLinkFromJson(String str) => MovieDirectLink.fromJson(json.decode(str));

String movieDirectLinkToJson(MovieDirectLink data) => json.encode(data.toJson());

class MovieDirectLink {
    List<Datum> data;

    MovieDirectLink({
        this.data,
    });

    factory MovieDirectLink.fromJson(Map<String, dynamic> json) => MovieDirectLink(
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
