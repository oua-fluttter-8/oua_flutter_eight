import 'package:cloud_firestore/cloud_firestore.dart';

class HotelModel {
  final String locationId;
  final String hotelName;
  final String hotelAddress;
  final String hotelCity;
  final String webUrl;
  final String rating;
  final String priceLevel;

  HotelModel({
    required this.locationId,
    required this.hotelName,
    required this.hotelAddress,
    required this.hotelCity,
    required this.webUrl,
    required this.rating,
    required this.priceLevel,
  });

  factory HotelModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data()!;

    return HotelModel(
      locationId: data['location_id'] ?? '',
      hotelName: data['name'] ?? '',
      hotelAddress: data['address'] ?? '',
      hotelCity: data['city'] ?? '',
      webUrl: data['webUrl'] ?? '',
      rating: data['rating'] ?? '',
      priceLevel: data['price_level'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'location_id': locationId,
      'name': hotelName,
      'address': hotelAddress,
      'city': hotelCity,
      'webUrl': webUrl,
      'rating': rating,
      'price_level': priceLevel,
    };
  }
}
