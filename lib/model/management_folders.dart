import 'dart:convert';

class ManagementFolders {
  ManagementFolders({
    required this.sjclManagement,
    required this.success,
    required this.message,
  });

  List<SjclManagementFolder> sjclManagement;
  int success;
  String message;

  factory ManagementFolders.fromJson(String str) => ManagementFolders.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ManagementFolders.fromMap(Map<String, dynamic> json) => ManagementFolders(
    sjclManagement: List<SjclManagementFolder>.from(json["sjcl_management"].map((x) => SjclManagementFolder.fromMap(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "sjcl_management": List<dynamic>.from(sjclManagement.map((x) => x.toMap())),
    "success": success,
    "message": message,
  };
}

class SjclManagementFolder {
  SjclManagementFolder({
    required this.id,
    required this.title,
    required this.updatedAt,
  });

  String id;
  String title;
  DateTime updatedAt;

  factory SjclManagementFolder.fromJson(String str) => SjclManagementFolder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SjclManagementFolder.fromMap(Map<String, dynamic> json) => SjclManagementFolder(
    id: json["id"],
    title: json["title"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "updated_at": updatedAt.toIso8601String(),
  };
}
