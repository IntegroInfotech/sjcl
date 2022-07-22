import 'dart:convert';

class DirectorMessage {
  DirectorMessage({
    required this.sjclDirectorMessage,
    required this.success,
    required this.message,
  });

  List<SjclDirectorMessage> sjclDirectorMessage;
  int success;
  String message;

  factory DirectorMessage.fromJson(String str) =>
      DirectorMessage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DirectorMessage.fromMap(Map<String, dynamic> json) => DirectorMessage(
        sjclDirectorMessage: List<SjclDirectorMessage>.from(
            json["sjcl_management"].map((x) => SjclDirectorMessage.fromMap(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "sjcl_management":
            List<dynamic>.from(sjclDirectorMessage.map((x) => x.toMap())),
        "success": success,
        "message": message,
      };
}

class SjclDirectorMessage {
  SjclDirectorMessage({
    required this.id,
    required this.name,
    required this.image,
    required this.message,
    required this.updatedAt,
  });

  String id;
  String name;
  String image;
  String message;
  DateTime updatedAt;

  factory SjclDirectorMessage.fromJson(String str) =>
      SjclDirectorMessage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SjclDirectorMessage.fromMap(Map<String, dynamic> json) =>
      SjclDirectorMessage(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        message: json["message"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
        "message": message,
        "updated_at": updatedAt.toIso8601String(),
      };
}
