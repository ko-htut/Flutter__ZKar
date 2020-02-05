import 'dart:convert';

Series seriesFromJson(String str) => Series.fromJson(json.decode(str));

String seriesToJson(Series data) => json.encode(data.toJson());

class Series {
    List<Datum> data;
    Links links;
    Meta meta;

    Series({
        this.data,
        this.links,
        this.meta,
    });

    factory Series.fromJson(Map<String, dynamic> json) => Series(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
    };
}

class Datum {
    int id;
    String title;
    String originalTitle;
    String poster;
    String cover;
    String contentRating;
    String imdbRating;
    String content;
    Language language;
    Credit credit;
    List<Genre> genre;

    Datum({
        this.id,
        this.title,
        this.originalTitle,
        this.poster,
        this.cover,
        this.contentRating,
        this.imdbRating,
        this.content,
        this.language,
        this.credit,
        this.genre,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        originalTitle: json["original_title"],
        poster: json["poster"],
        cover: json["cover"],
        contentRating: json["content_rating"],
        imdbRating: json["imdb_rating"],
        content: json["content"],
        language: Language.fromJson(json["language"]),
        credit: Credit.fromJson(json["credit"]),
        genre: List<Genre>.from(json["genre"].map((x) => Genre.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "original_title": originalTitle,
        "poster": poster,
        "cover": cover,
        "content_rating": contentRating,
        "imdb_rating": imdbRating,
        "content": content,
        "language": language.toJson(),
        "credit": credit.toJson(),
        "genre": List<dynamic>.from(genre.map((x) => x.toJson())),
    };
}

class Credit {
    int id;
    Name name;
    Image image;

    Credit({
        this.id,
        this.name,
        this.image,
    });

    factory Credit.fromJson(Map<String, dynamic> json) => Credit(
        id: json["id"],
        name: nameValues.map[json["name"]],
        image: json["image"] == null ? null : imageValues.map[json["image"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "image": image == null ? null : imageValues.reverse[image],
    };
}

enum Image { CREDIT_1566393598_PNG, TAKASHI_SENPAI }

final imageValues = EnumValues({
    "credit_1566393598.png": Image.CREDIT_1566393598_PNG,
    "Takashi Senpai": Image.TAKASHI_SENPAI
});

enum Name { EBOX, ICE_CHINESE_SERIES_PAGE, TAKASHI_SENPAI }

final nameValues = EnumValues({
    "EBOX": Name.EBOX,
    "ICE Chinese Series Page": Name.ICE_CHINESE_SERIES_PAGE,
    "Takashi Senpai": Name.TAKASHI_SENPAI
});

class Genre {
    int id;
    String name;

    Genre({
        this.id,
        this.name,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Language {
    int id;
    String title;
    String logo;

    Language({
        this.id,
        this.title,
        this.logo,
    });

    factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        title: json["title"],
        logo: json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "logo": logo,
    };
}

class Links {
    String first;
    String last;
    dynamic prev;
    String next;

    Links({
        this.first,
        this.last,
        this.prev,
        this.next,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
    };
}

class Meta {
    int currentPage;
    int from;
    int lastPage;
    String path;
    int perPage;
    int to;
    int total;

    Meta({
        this.currentPage,
        this.from,
        this.lastPage,
        this.path,
        this.perPage,
        this.to,
        this.total,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
