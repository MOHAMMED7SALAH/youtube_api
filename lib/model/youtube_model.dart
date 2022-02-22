// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    

    Data data;
    bool status;
    dynamic error;
    int statusCode;
  Welcome({
    required this.data,
    required this.status,
    required this.error,
    required this.statusCode,
  });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        data: Data.fromJson(json["data"]),
        status: json["status"],
        error: json["error"],
        statusCode: json["statusCode"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "status": status,
        "error": error,
        "statusCode": statusCode,
    };
}

class Data {
    Data({
        required this.link,
    });

    List<Link> link;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        link: List<Link>.from(json["link"].map((x) => Link.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "link": List<dynamic>.from(link.map((x) => x.toJson())),
    };
}

class Link {
    

    int id;
    String title;
    String link;
    DateTime createdAt;
    DateTime updatedAt;
  Link({
    required this.id,
    required this.title,
    required this.link,
    required this.createdAt,
    required this.updatedAt,
  });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        id: json["id"],
        title: json["title"],
        link: json["link"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "link": link,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}