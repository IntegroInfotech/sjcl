import 'dart:convert';

class Notifications {
  Notifications({
    required this.sjclNotification,
    required this.success,
    required this.message,
  });

  List<SjclNotification> sjclNotification;
  int success;
  String message;

  factory Notifications.fromJson(String str) => Notifications.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Notifications.fromMap(Map<String, dynamic> json) => Notifications(
    sjclNotification: List<SjclNotification>.from(json["sjcl_notification"].map((x) => SjclNotification.fromMap(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "sjcl_notification": List<dynamic>.from(sjclNotification.map((x) => x.toMap())),
    "success": success,
    "message": message,
  };
}

class SjclNotification {
  SjclNotification({
    required this.id,
    required this.title,
    required this.date,
    required this.description,
    required this.weblink,
    required this.updatedAt,
  });

  String id;
  String title;
  String date;
  String description;
  String weblink;
  DateTime updatedAt;

  factory SjclNotification.fromJson(String str) => SjclNotification.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SjclNotification.fromMap(Map<String, dynamic> json) => SjclNotification(
    id: json["id"],
    title: json["title"],
    date: json["date"],
    description: json["description"],
    weblink: json["weblink"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "date": date,
    "description": description,
    "weblink": weblink,
    "updated_at": updatedAt.toIso8601String(),
  };
}
