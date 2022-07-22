import 'dart:convert';

class News {
  News({
    required this.sjclNews,
    required this.success,
    required this.message,
  });

  List<SjclNew> sjclNews;
  int success;
  String message;

  factory News.fromJson(String str) => News.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory News.fromMap(Map<String, dynamic> json) => News(
        sjclNews: List<SjclNew>.from(
            json["sjcl_news"].map((x) => SjclNew.fromMap(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "sjcl_news": List<dynamic>.from(sjclNews.map((x) => x.toMap())),
        "success": success,
        "message": message,
      };
}

class SjclNew {
  SjclNew({
    required this.id,
    required this.sImg,
    required this.lImg,
    required this.title,
    required this.date,
    required this.description,
    required this.updatedAt,
  });

  String id;
  String sImg;
  String lImg;
  String title;
  String date;
  String description;
  DateTime updatedAt;

  factory SjclNew.fromJson(String str) => SjclNew.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SjclNew.fromMap(Map<String, dynamic> json) => SjclNew(
        id: json["id"],
        sImg: json["s_img"],
        lImg: json["l_img"],
        title: json["title"],
        date: json["date"],
        description: json["description"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "s_img": sImg,
        "l_img": lImg,
        "title": title,
        "date": date,
        "description": description,
        "updated_at": updatedAt.toIso8601String(),
      };
}
