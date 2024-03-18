import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oua_flutter_eight/models/user_model.dart';

import '../../core/error/firestore_error_handling.dart';

class UserRepository {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("users");

  Future<void> createUser(String email, String uid, String nameSurname) async {
    try {
      UserModel userProfile =
          UserModel(uid: uid, email: email, nameSurname: nameSurname);
      await collectionReference.doc(uid).set(userProfile.toFirestore());
    } catch (e) {
      if (e is FirebaseException) {
        String errorMessage = FirestoreExceptionHelper.handleException(e.code);
        throw Exception(errorMessage);
      }
      throw Exception(e);
    }
  }

  Future<Object> fetchUser(String uid) async {
    try {
      final userProfileDb = await collectionReference.doc(uid).get();
      final userProfile = UserModel.fromFirestore(userProfileDb);
      return userProfile;
    } catch (e) {
      if (e is FirebaseException) {
        String errorMessage = FirestoreExceptionHelper.handleException(e.code);
        return errorMessage;
      }
      return e;
    }
  }

  Future<void> updateUser(UserModel userProfile, String uid) async {
    try {
      await collectionReference.doc(uid).update(userProfile.toFirestore());
    } catch (e) {
      if (e is FirebaseException) {
        String errorMessage = FirestoreExceptionHelper.handleException(e.code);
        throw Exception(errorMessage);
      }
      throw Exception(e);
    }
  }

  Future<void> addFavoriteLocation(String uid, String locationId) async {
    try {
      await collectionReference.doc(uid).update({
        "favoriteLocations": FieldValue.arrayUnion([locationId])
      });
    } catch (e) {
      if (e is FirebaseException) {
        String errorMessage = FirestoreExceptionHelper.handleException(e.code);
        throw Exception(errorMessage);
      }
      throw Exception(e);
    }
  }

  Future<void> deleteFavoriteLocation(String uid, String locationId) async {
    try {
      await collectionReference.doc(uid).update({
        "favoriteLocations": FieldValue.arrayRemove([locationId])
      });
    } catch (e) {
      if (e is FirebaseException) {
        String errorMessage = FirestoreExceptionHelper.handleException(e.code);
        throw Exception(errorMessage);
      }
      throw Exception(e);
    }
  }
}
