import 'dart:convert';

class EventsResponse {
  EventsResponse({
    required this.sjclEvent,
    required this.success,
    required this.message,
  });

  List<SjclEvent> sjclEvent;
  int success;
  String message;

  factory EventsResponse.fromJson(String str) => EventsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EventsResponse.fromMap(Map<String, dynamic> json) => EventsResponse(
    sjclEvent: List<SjclEvent>.from(json["sjcl_event"].map((x) => SjclEvent.fromMap(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "sjcl_event": List<dynamic>.from(sjclEvent.map((x) => x.toMap())),
    "success": success,
    "message": message,
  };
}

class SjclEvent {
  SjclEvent({
    required this.id,
    required this.image,
    required this.title,
    required this.date,
    required this.description,
    required this.pdf,
  });

  String id;
  String image;
  String title;
  String date;
  String description;
  String pdf;

  factory SjclEvent.fromJson(String str) => SjclEvent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SjclEvent.fromMap(Map<String, dynamic> json) => SjclEvent(
    id: json["id"],
    image: json["image"],
    title: json["title"],
    date: json["date"],
    description: json["description"],
    pdf: json["pdf"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "image": image,
    "title": title,
    "date": date,
    "description": description,
    "pdf": pdf,
  };
}
