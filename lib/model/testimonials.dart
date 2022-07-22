import 'dart:convert';

class Testimonials {
  Testimonials({
    required this.sjclTestimonials,
    required this.success,
    required this.message,
  });

  List<SjclTestimonial> sjclTestimonials;
  int success;
  String message;

  factory Testimonials.fromJson(String str) => Testimonials.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Testimonials.fromMap(Map<String, dynamic> json) => Testimonials(
    sjclTestimonials: List<SjclTestimonial>.from(json["sjcl_testimonials"].map((x) => SjclTestimonial.fromMap(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "sjcl_testimonials": List<dynamic>.from(sjclTestimonials.map((x) => x.toMap())),
    "success": success,
    "message": message,
  };
}

class SjclTestimonial {
  SjclTestimonial({
    required this.id,
    required this.image,
    required this.batch,
    required this.message,
    required this.updatedAt,
  });

  String id;
  String image;
  String batch;
  String message;
  DateTime updatedAt;

  factory SjclTestimonial.fromJson(String str) => SjclTestimonial.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SjclTestimonial.fromMap(Map<String, dynamic> json) => SjclTestimonial(
    id: json["id"],
    image: json["image"],
    batch: json["batch"],
    message: json["message"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "image": image,
    "batch": batch,
    "message": message,
    "updated_at": updatedAt.toIso8601String(),
  };
}
