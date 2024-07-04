class Doctors {
  String? name;
  String? type;
  String? pio;
  String? image;
  int? number;
  String? id;
  Doctors({
    required this.name,
    required this.type,
    this.pio,
    this.image,
    this.number,
    this.id
  });

  factory Doctors.fromJson(Map<String, dynamic> json) {
    return Doctors(
      name: json['name'] as String? ?? "",
      type: json['type'] as String? ?? "",
      pio: json['pio'] as String? ?? "",
      id: json['id'] as String? ?? "",
      image: json['image'] as String? ?? "",
      number: json['number'] != null ? json['number'] as int : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name ?? "",
      'type': type ?? "",
      'pio': pio ?? "",
      'id': id ?? "",
      'image': image ?? "",
      'number': number,

    };
  }

}