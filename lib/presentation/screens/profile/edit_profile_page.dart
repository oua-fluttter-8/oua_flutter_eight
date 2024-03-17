import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oua_flutter_eight/logic/blocs/auth/auth_state.dart';
import 'package:oua_flutter_eight/logic/blocs/user/user_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/user/user_event.dart';
import 'package:oua_flutter_eight/logic/blocs/user/user_state.dart';
import 'package:oua_flutter_eight/models/user_model.dart';
import 'package:oua_flutter_eight/presentation/widgets/profile/custom_circle_avatar.dart';
import 'package:oua_flutter_eight/presentation/widgets/profile/profile_textfield_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../logic/blocs/auth/auth_bloc.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameSurnameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  File profilePictureUrl = File("");
  String profilePictureUrlString = "";
  late String userId;
  late UserModel user;

  Future<void> pickImage(String url) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        profilePictureUrl = File(pickedImage.path);
      });

      await uploadImage(url); // uploadImage metodunun tamamlanmasını bekleyin
    } else {
      // Resim seçilmediğinde yapılacak işlemler
    }
  }

  Future<void> uploadImage(String uid) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('profilePhoto/$uid/image.png');
      UploadTask uploadTask = ref.putFile(profilePictureUrl);
      await uploadTask;
      profilePictureUrlString = await ref.getDownloadURL();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    if (authState is Authenticated) {
      userId = authState.userId!;
    } else {
      userId = "";
    }
    final userState = context.watch<UserBloc>().state;
    if (userState is UserFetchedState) {
      user = userState.user!;
      nameSurnameController.text = user.nameSurname;
      locationController.text = user.location ?? "";
    } else if (userState is UserFetchLoadingState) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    } else if (userState is UserFetchErrorState) {
    } else if (userState is UserInitialState) {
      context.read<UserBloc>().add(UserFetchEvent(userId: userId));
    } else {
      user = UserModel(uid: "", nameSurname: "", email: "");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Bilgileri"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<UserBloc>().add(UserUpdateEvent(
                  userId: user.uid,
                  userProfile: UserModel(
                    uid: user.uid,
                    email: user.email,
                    nameSurname: nameSurnameController.text,
                    location: locationController.text,
                    profilePhotoUrl: profilePictureUrlString == ""
                        ? user.profilePhotoUrl
                        : profilePictureUrlString,
                  )));
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SafeArea(
        bottom: true,
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    CustomCircleAvatar(
                      radius: 80,
                      pickedImage: profilePictureUrl,
                      userPhotoUrl: user.profilePhotoUrl ?? "",
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        pickImage(user.uid);
                      },
                      child: Text(
                        "Profil resmini değiştir",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.orange.shade500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ProfileTextField_widgets(
                      title: "Ad Soyad",
                      controller: nameSurnameController,
                    ),
                    const SizedBox(height: 20),
                    ProfileTextField_widgets(
                      title: "Konum",
                      controller: locationController,
                    ),
                    const SizedBox(height: 190),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
