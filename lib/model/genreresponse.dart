import 'dart:convert';

Genres genreFromJson(String str) => Genres.fromJson(json.decode(str));

String genreToJson(Genres data) => json.encode(data.toJson());

class Genres {
    List<Datum> data;

    Genres({
        this.data,
    });

    factory Genres.fromJson(Map<String, dynamic> json) => Genres(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String name;

    Datum({
        this.id,
        this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
