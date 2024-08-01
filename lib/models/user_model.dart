import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
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

  UserModel(
      {this.firstName,
      this.lastName,
      this.profilePicture,
      this.city,
      this.gender,
      this.email,
      this.profilePic,
      this.telephone,
      this.dateOfBirth,
      this.occupation,
      this.country,
      this.primaryHospital,
      this.weight,
      this.height});

  // Converts a UserModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
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

  // Creates a UserModel instance from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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

  // Creates a UserModel instance from a JSON string
  static UserModel userFromJsonString(String jsonString) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return UserModel.fromJson(jsonMap);
  }

  // Converts a UserModel instance to a JSON string
  String userToJsonString() {
    Map<String, dynamic> jsonMap = this.toJson();
    return jsonEncode(jsonMap);
  }
}
