import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String nameSurname;
  String? profilePhotoUrl;
  String? location;

  UserModel({required this.uid, required this.email, required this.nameSurname, this.profilePhotoUrl, this.location});

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'email': email,
      'nameSurname': nameSurname,
      'profilePhotoUrl': profilePhotoUrl,
      'location': location,
    };
  }

   factory UserModel.fromFirestore(DocumentSnapshot document) {
    Map<String, dynamic>? json = document.data() as Map<String, dynamic>?;

    json ??= {};

    return UserModel(
      uid: json['uid'],
      profilePhotoUrl: json['profilePictureUrl'],
      nameSurname: json['nameSurname'],
      email: json['email'],
      location: json['location'],
    );
  }
}