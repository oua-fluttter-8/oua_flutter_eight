import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel {
  final String locationId;
  final String locationName;
  final String locationPhotoUrl;
  final String locationDescription;
  final String locationCategory;
  final String locationCity;
  final List<String> locationGallery;

  LocationModel(
      {required this.locationId,
      required this.locationName,
      required this.locationPhotoUrl,
      required this.locationDescription,
      required this.locationCategory,
      required this.locationCity,
      required this.locationGallery});

  factory LocationModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return LocationModel(
      locationId: doc.id,
      locationName: data['locationName'] ?? '',
      locationPhotoUrl: data['locationPhotoUrl'] ?? '',
      locationDescription: data['locationDescription'] ?? '',
      locationCategory: data['locationCategory'] ?? '',
      locationCity: data['locationCity'] ?? '',
      locationGallery: List<String>.from(data['locationGallery'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'locationName': locationName,
      'locationPhotoUrl': locationPhotoUrl,
      'locationDescription': locationDescription,
      'locationCategory': locationCategory,
      'locationCity': locationCity,
      'locationGallery': locationGallery,
    };
  }
}
