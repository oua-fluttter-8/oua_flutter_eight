import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  String nameSurname;
  String? profilePhotoUrl;
  String? location;
  List<String>? favoriteLocations;

  UserModel({
    required this.uid,
    required this.email,
    required this.nameSurname,
    this.profilePhotoUrl,
    this.location,
    this.favoriteLocations,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'email': email,
      'nameSurname': nameSurname,
      'profilePhotoUrl': profilePhotoUrl ?? "",
      'location': location ?? "",
      'favoriteLocations': favoriteLocations ?? [],
    };
  }

  factory UserModel.fromFirestore(DocumentSnapshot document) {
    Map<String, dynamic>? json = document.data() as Map<String, dynamic>?;

    json ??= {};

    return UserModel(
      uid: json['uid'],
      profilePhotoUrl: json['profilePhotoUrl'],
      nameSurname: json['nameSurname'],
      email: json['email'],
      location: json['location'],
      favoriteLocations: List<String>.from(json['favoriteLocations'] ?? []),
    );
  }
}
