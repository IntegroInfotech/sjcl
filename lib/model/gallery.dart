import 'dart:convert';

class Gallery {
  Gallery({
    required this.sjclPhotos,
    required this.success,
    required this.message,
  });

  List<SjclPhoto> sjclPhotos;
  int success;
  String message;

  factory Gallery.fromJson(String str) => Gallery.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Gallery.fromMap(Map<String, dynamic> json) => Gallery(
    sjclPhotos: List<SjclPhoto>.from(json["sjcl_photos"].map((x) => SjclPhoto.fromMap(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "sjcl_photos": List<dynamic>.from(sjclPhotos.map((x) => x.toMap())),
    "success": success,
    "message": message,
  };
}

class SjclPhoto {
  SjclPhoto({
    required this.id,
    required this.image,
    required this.updatedAt,
  });

  String id;
  String image;
  DateTime updatedAt;

  factory SjclPhoto.fromJson(String str) => SjclPhoto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SjclPhoto.fromMap(Map<String, dynamic> json) => SjclPhoto(
    id: json["id"],
    image: json["image"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "image": image,
    "updated_at": updatedAt.toIso8601String(),
  };
}
