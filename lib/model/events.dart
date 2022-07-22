import 'dart:convert';

class Events {
  Events({
    required this.sjclEvents,
    required this.success,
    required this.message,
  });

  List<SjclEvent> sjclEvents;
  int success;
  String message;

  factory Events.fromJson(String str) => Events.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Events.fromMap(Map<String, dynamic> json) => Events(
    sjclEvents: List<SjclEvent>.from(json["sjcl_events"].map((x) => SjclEvent.fromMap(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "sjcl_events": List<dynamic>.from(sjclEvents.map((x) => x.toMap())),
    "success": success,
    "message": message,
  };
}

class SjclEvent {
  SjclEvent({
    required this.id,
    required this.title,
    required this.pdf,
    required this.updatedAt,
  });

  String id;
  String title;
  String pdf;
  DateTime updatedAt;

  factory SjclEvent.fromJson(String str) => SjclEvent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SjclEvent.fromMap(Map<String, dynamic> json) => SjclEvent(
    id: json["id"],
    title: json["title"],
    pdf: json["pdf"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "pdf": pdf,
    "updated_at": updatedAt.toIso8601String(),
  };
}
