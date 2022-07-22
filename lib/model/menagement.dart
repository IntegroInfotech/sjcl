import 'dart:convert';

class Management {
  Management({
    required this.management,
    required this.success,
    required this.message,
  });

  List<SjclManagement> management;
  int success;
  String message;

  factory Management.fromJson(String str) =>
      Management.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Management.fromMap(Map<String, dynamic> json) => Management(
        management: List<SjclManagement>.from(
            json["management"].map((x) => SjclManagement.fromMap(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "management": List<dynamic>.from(management.map((x) => x.toMap())),
        "success": success,
        "message": message,
      };
}

class SjclManagement {
  SjclManagement({
    required this.id,
    required this.mid,
    required this.name,
    required this.image,
    required this.designation,
    required this.qualification,
    required this.updatedAt,
  });

  String id;
  String mid;
  String name;
  String image;
  String designation;
  String qualification;
  DateTime updatedAt;

  factory SjclManagement.fromJson(String str) =>
      SjclManagement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SjclManagement.fromMap(Map<String, dynamic> json) =>
      SjclManagement(
        id: json["id"],
        mid: json["mid"],
        name: json["name"],
        image: json["image"],
        designation: json["designation"],
        qualification: json["qualification"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "mid": mid,
        "name": name,
        "image": image,
        "designation": designation,
        "qualification": qualification,
        "updated_at": updatedAt.toIso8601String(),
      };
}
