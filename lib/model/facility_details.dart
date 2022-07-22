import 'dart:convert';

class FacilitiesDetails {
  FacilitiesDetails({
    required this.facility,
    required this.success,
    required this.message,
  });

  List<SjclFacilityDetails> facility;
  int success;
  String message;

  factory FacilitiesDetails.fromJson(String str) => FacilitiesDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FacilitiesDetails.fromMap(Map<String, dynamic> json) => FacilitiesDetails(
    facility: List<SjclFacilityDetails>.from(json["facility"].map((x) => SjclFacilityDetails.fromMap(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "facility": List<dynamic>.from(facility.map((x) => x.toMap())),
    "success": success,
    "message": message,
  };
}

class SjclFacilityDetails {
  SjclFacilityDetails({
    required this.id,
    required this.fid,
    required this.title,
    required this.image,
    required this.description,
    required this.updatedAt,
  });

  String id;
  String fid;
  String title;
  String image;
  String description;
  DateTime updatedAt;

  factory SjclFacilityDetails.fromJson(String str) => SjclFacilityDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SjclFacilityDetails.fromMap(Map<String, dynamic> json) => SjclFacilityDetails(
    id: json["id"],
    fid: json["fid"],
    title: json["title"],
    image: json["image"],
    description: json["description"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "fid": fid,
    "title": title,
    "image": image,
    "description": description,
    "updated_at": updatedAt.toIso8601String(),
  };
}
