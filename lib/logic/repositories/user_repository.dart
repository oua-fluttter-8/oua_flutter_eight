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
}