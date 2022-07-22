import 'dart:convert';

class NewsImages {
  NewsImages({
    required this.newsImages,
    required this.success,
    required this.message,
  });

  List<SjclNewsImage> newsImages;
  int success;
  String message;

  factory NewsImages.fromJson(String str) => NewsImages.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewsImages.fromMap(Map<String, dynamic> json) => NewsImages(
    newsImages: List<SjclNewsImage>.from(json["newsimages"].map((x) => SjclNewsImage.fromMap(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "newsimages": List<dynamic>.from(newsImages.map((x) => x.toMap())),
    "success": success,
    "message": message,
  };
}

class SjclNewsImage {
  SjclNewsImage({
    required this.id,
    required this.newsId,
    required this.image,
    required this.updatedAt,
  });

  String id;
  String newsId;
  String image;
  DateTime updatedAt;

  factory SjclNewsImage.fromJson(String str) => SjclNewsImage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SjclNewsImage.fromMap(Map<String, dynamic> json) => SjclNewsImage(
    id: json["id"],
    newsId: json["news_id"],
    image: json["image"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "news_id": newsId,
    "image": image,
    "updated_at": updatedAt.toIso8601String(),
  };
}
