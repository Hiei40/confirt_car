import 'package:cloud_firestore/cloud_firestore.dart';

class Blogmodel {
  String mainTitle;
  List<String> blogTitles;
  List<String> blogContents;
  List<String> imageUrls;
  Timestamp dateofPublish;

  Blogmodel({
    required this.mainTitle,
    required this.blogTitles,
    required this.blogContents,
    required this.imageUrls,
    required this.dateofPublish,
  });

  factory Blogmodel.fromJson(Map<String, dynamic> json) {
    return Blogmodel(
      mainTitle: json['mainTitle'],
      blogTitles: List<String>.from(json['blogTitles']),
      blogContents: List<String>.from(json['blogContents']),
      imageUrls: List<String>.from(json['imageUrls']),
      dateofPublish: json['dateofPublish'] != null
          ? (json['dateofPublish'] as Timestamp)
          : Timestamp.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mainTitle': mainTitle,
      'blogTitles': blogTitles,
      'blogContents': blogContents,
      'imageUrls': imageUrls,
      'dateofPublish': dateofPublish,
    };
  }
}
