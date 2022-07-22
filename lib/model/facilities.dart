import 'dart:convert';

class Facilities {
  Facilities({
    required this.sjclFacility,
    required this.success,
    required this.message,
  });

  List<SjclFacility> sjclFacility;
  int success;
  String message;

  factory Facilities.fromJson(String str) => Facilities.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Facilities.fromMap(Map<String, dynamic> json) => Facilities(
    sjclFacility: List<SjclFacility>.from(json["sjcl_facility"].map((x) => SjclFacility.fromMap(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "sjcl_facility": List<dynamic>.from(sjclFacility.map((x) => x.toMap())),
    "success": success,
    "message": message,
  };
}

class SjclFacility {
  SjclFacility({
    required this.id,
    required this.title,
    required this.updatedAt,
  });

  String id;
  String title;
  String updatedAt;

  factory SjclFacility.fromJson(String str) => SjclFacility.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SjclFacility.fromMap(Map<String, dynamic> json) => SjclFacility(
    id: json["id"],
    title: json["title"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "updated_at": updatedAt,
  };
}
