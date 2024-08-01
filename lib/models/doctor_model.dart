import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DoctorModel {
  String? speciality;
  String? hospital;
  String? experience;
  String? firstName;
  String? lastName;
  String? profilePicture;
  String? gender;
  DateTime? dateOfBirth;
  String? country;
  String? email;
  String? telephone;
  String? occupation;
  String? city;
  String? primaryHospital;
  String? weight;
  String? height;
  FileImage? profilePic;

  DoctorModel(
      {this.speciality,
      this.hospital,
      this.experience,
      this.firstName,
      this.lastName,
      this.profilePicture,
      this.city,
      this.gender,
      this.dateOfBirth,
      this.country,
      this.email,
      this.telephone,
      this.occupation,
      this.primaryHospital,
      this.weight,
      this.height,
      this.profilePic});
  Map<String, dynamic> toJson() {
    return {
      'speciality': speciality,
      'hospital': hospital,
      'experience': experience,
      'firstName': firstName,
      'lastName': lastName,
      'profilePicture': profilePicture,
      'city': city,
      'email': email,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'occupation': occupation,
      'country': country,
      'primaryHospital': primaryHospital,
      'weight': weight,
      'height': height,
      'telephone': telephone,
    };
  }

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      speciality: json['speciality'],
      hospital: json['hospital'],
      experience: json['experience'],
      telephone: json['telephone'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      profilePicture: json['profilePicture'],
      email: json['email'],
      city: json['city'],
      gender: json['gender'],
      dateOfBirth: (json['dateOfBirth'] as Timestamp).toDate(),
      occupation: json['occupation'],
      country: json['country'],
      primaryHospital: json['primaryHospital'],
      weight: json['weight'],
      height: json['height'],
    );
  }
  static DoctorModel doctorFromJsonString(String jsonString) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return DoctorModel.fromJson(jsonMap);
  }

  // Converts a UserModel instance to a JSON string
  String doctorToJsonString() {
    Map<String, dynamic> jsonMap = this.toJson();
    return jsonEncode(jsonMap);
  }
}
