import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  List<Datum> data;
  Links links;
  Meta meta;

  Movie({
    this.data,
    this.links,
    this.meta,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
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
  String runtime;
  String releaseDate;
  String contentRating;
  String imdbRating;
  String content;
  int points;
  int viewCount;
  int downloadCount;
  Language language;
  Credit credit;
  List<Genre> genre;
  String bought;

  Datum({
    this.id,
    this.title,
    this.originalTitle,
    this.poster,
    this.cover,
    this.runtime,
    this.releaseDate,
    this.contentRating,
    this.imdbRating,
    this.content,
    this.points,
    this.viewCount,
    this.downloadCount,
    this.language,
    this.credit,
    this.genre,
    this.bought,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        originalTitle: json["original_title"],
        poster: json["poster"],
        cover: json["cover"],
        runtime: json["runtime"],
        releaseDate: json["release_date"],
        contentRating: json["content_rating"],
        imdbRating: json["imdb_rating"],
        content: json["content"],
        points: json["points"],
        viewCount: json["view_count"],
        downloadCount: json["download_count"],
        language: Language.fromJson(json["language"]),
        credit: Credit.fromJson(json["credit"]),
        genre: List<Genre>.from(json["genre"].map((x) => Genre.fromJson(x))),
        bought: json["bought"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "original_title": originalTitle,
        "poster": poster,
        "cover": cover,
        "runtime": runtime,
        "release_date": releaseDate,
        "content_rating": contentRating,
        "imdb_rating": imdbRating,
        "content": content,
        "points": points,
        "view_count": viewCount,
        "download_count": downloadCount,
        "language": language.toJson(),
        "credit": credit.toJson(),
        "genre": List<dynamic>.from(genre.map((x) => x.toJson())),
        "bought": bought,
      };
}

class Credit {
  int id;
  String name;
  String image;

  Credit({
    this.id,
    this.name,
    this.image,
  });

  factory Credit.fromJson(Map<String, dynamic> json) => Credit(
        id: json["id"],
        name: json["name"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image == null ? null : image,
      };
}

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
