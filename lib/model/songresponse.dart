import 'dart:convert';

Song songFromJson(String str) => Song.fromJson(json.decode(str));

String songToJson(Song data) => json.encode(data.toJson());

class Song {
    List<Datum> data;

    Song({
        this.data,
    });

    factory Song.fromJson(Map<String, dynamic> json) => Song(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String title;
    String image;
    String video;
    String content;
    String type;
    int status;

    Datum({
        this.id,
        this.title,
        this.image,
        this.video,
        this.content,
        this.type,
        this.status,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        video: json["video"],
        content: json["content"],
        type: json["type"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "video": video,
        "content": content,
        "type": type,
        "status": status,
    };
}
