import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oua_flutter_eight/logic/blocs/user/user_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/user/user_state.dart';
import 'package:oua_flutter_eight/models/user_model.dart';
import 'package:oua_flutter_eight/presentation/widgets/profile/profile_item_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    UserModel? userProfile;
    final userBlocState = context.watch<UserBloc>().state;

    if (userBlocState is UserFetchedState) {
      userProfile = userBlocState.user!;
    }
    if (userProfile == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Profil",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 40),
                    CircleAvatar(
                      radius: 48,
                      backgroundImage: NetworkImage(userProfile
                              .profilePhotoUrl ??
                          "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      userProfile.nameSurname == ""
                          ? "Hata"
                          : userProfile.nameSurname,
                      style: const TextStyle(
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userProfile.email == "" ? "Hata" : userProfile.email,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.3), // Açık gri gölge
                            spreadRadius: 2,
                            blurRadius: 9,
                            offset:
                                const Offset(0, 3), // Gölgenin yönü ve uzaklığı
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Ödül Puanları',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '360',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.orange.shade500,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Seyahatler',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '12',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.orange.shade500,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Listeler',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '10',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.orange.shade500,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Items(
                        onTap: () {
                          Navigator.pushNamed(context, "/edit_profile",
                              arguments: userProfile);
                        },
                        title: " Profil Bilgilerim",
                        iconData: FontAwesomeIcons.user),
                    const SizedBox(height: 10),
                    Items(
                        onTap: () {},
                        title: " Listelerim",
                        iconData: FontAwesomeIcons.bookmark),
                    const SizedBox(height: 10),
                    Items(
                        onTap: () {},
                        title: " Listelerim",
                        iconData: FontAwesomeIcons.map),
                    const SizedBox(height: 10),
                    Items(
                        onTap: () {},
                        title: " Ayarlar",
                        iconData: FontAwesomeIcons.gear),
                    const SizedBox(height: 10),
                    Items(
                        onTap: () {},
                        title: " Yardım",
                        iconData: FontAwesomeIcons.globe),
                    const SizedBox(height: 40),
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
