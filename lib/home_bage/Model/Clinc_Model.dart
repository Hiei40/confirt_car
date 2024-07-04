class Clinics {
  String name;
  String photo;

  Clinics({required this.name, required this.photo});

  factory Clinics.fromJson(Map<String, dynamic> json) {
    return Clinics(
      name: json['Name'],
      photo: json['Photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Photo': photo,
    };
  }
}
