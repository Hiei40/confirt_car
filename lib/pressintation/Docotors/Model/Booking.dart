// Corrected imports
import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  String? doctorName;
  String? email;
  String? name;
  int? number;
  String? phoneNumber;
  Timestamp? Date; // Assuming Timestamp is imported correctly from 'package:cloud_firestore/cloud_firestore.dart'

  Booking({
    required this.doctorName,
    required this.email,
    required this.name,
    required this.number,
    required this.phoneNumber,
    // required this.Date,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      doctorName: json['DoctorName'] ?? '',
      email: json['Email'] ?? '',
      name: json['Name'] ?? '',
      number: json['Number'] ?? 0, // Use integer literals directly
      phoneNumber: json['Phonenumber'] ?? '',
      // Date: json['Date'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'DoctorName': doctorName,
      'Email': email,
      'Name': name,
      'Number': number,
      'Phonenumber': phoneNumber,
      // 'Date':Date,
    };
  }
}
