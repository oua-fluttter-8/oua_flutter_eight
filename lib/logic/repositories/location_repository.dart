import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oua_flutter_eight/models/location_model.dart';

class LocationRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<LocationModel>> fetchLocations() async {
    try {
      final locationList = await _firestore.collection('locations').get();
      return locationList.docs
          .map((doc) => LocationModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<LocationModel>> fetchLocationsByCity(String city) async {
    try {
      final locationList = await _firestore
          .collection('locations')
          .where('locationCity', isEqualTo: city)
          .get();

      final list = locationList.docs
          .map((doc) => LocationModel.fromFirestore(doc))
          .toList();

      return list;
    } catch (e) {
      throw Exception(e);
    }
  }
}
