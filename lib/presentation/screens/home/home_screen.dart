import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/auth/auth_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/auth/auth_event.dart';
import 'package:oua_flutter_eight/logic/blocs/auth/auth_state.dart';
import 'package:oua_flutter_eight/logic/blocs/user/user_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/user/user_event.dart';
import 'package:oua_flutter_eight/presentation/screens/ayarlar_ekrani/ayarlar_ekrani.dart';
import 'package:oua_flutter_eight/presentation/screens/favorites/favorites.dart';
import 'package:oua_flutter_eight/presentation/screens/home/home_page.dart';
import 'package:oua_flutter_eight/presentation/screens/home/location_test.dart';
import 'package:oua_flutter_eight/presentation/screens/lokasyon/lokasyon_screen.dart';
import 'package:oua_flutter_eight/presentation/screens/search_page/search_page.dart';

import '../../../data/push_data.dart';
import '../../../logic/blocs/user/user_state.dart';
import '../onboarding_screen_design/onboarding_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userId;
  const HomeScreen({super.key, required this.userId});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          Navigator.pushReplacementNamed(context, "/sign_in");
        } else if (state is AuthError) {
          Navigator.pushReplacementNamed(context, "/sign_in");
        } else if (state is Authenticated) {}
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitialState) {
            if (widget.userId.isEmpty) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text('Boş'),
                  ),
                ],
              );
            } else {
              context
                  .read<UserBloc>()
                  .add(UserFetchEvent(userId: widget.userId));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserFetchLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserFetchErrorState) {
            return const Center(
              child: Text('Error'),
            );
          } else if (state is UserFetchedState) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthLogout());
                      },
                      child: const Text('Sign Out'),
                    ),
                    const Text('Home Screen'),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/profile");
                      },
                      child: const Text("Profil"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const OnboardingScreenDesignPage()));
                      },
                      child: const Text("Onboarding"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LokasyonScreen()));
                      },
                      child: const Text("Lokasyon"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AyarlarEkrani()));
                      },
                      child: const Text("Ayarlar"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LocationTest()));
                      },
                      child: const Text("Lokasyon"),
                    ),
                    const HotelCard(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainPage()));
                      },
                      child: const Text("MainPage"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchPage()));
                      },
                      child: const Text("Search"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FavoritesPage()));
                      },
                      child: const Text("Favori"),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

void push() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  await firestore.collection("hotels").add(HotelModel(
          locationId: "r3hzi6eRJ5t2S45pLueM",
          hotelName: "Sofia Corner Hotel",
          hotelAddress:
              "Küçük Ayasofya Mahallesi, Bardakçı Sk. No:18, İstanbul 34122 Türkiye",
          hotelCity: "İstanbul",
          webUrl:
              "https://www.tripadvisor.com.tr/Hotel_Review-g293974-d19750255-Reviews-Sofia_Corner_Hotel-Istanbul.html?m=66827",
          rating: "4.5",
          priceLevel: "\$")
      .toFirestore());
}

void fetch() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await firestore.collection("hotels").get();
  for (var element in querySnapshot.docs) {
    print(element.data());
  }
}

class HotelCard extends StatelessWidget {
  const HotelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                Expanded(flex: 3, child: Text("Hotel Name")),
                Spacer(),
                Expanded(child: Text("Rating")),
                Spacer(),
              ],
            ),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                Expanded(flex: 3, child: Text("Adress")),
                Spacer(),
                Expanded(child: Text("Adress")),
                Spacer(),
              ],
            ),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                Expanded(flex: 0, child: Text("Adress")),
                Spacer(),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  fetch();
                  //push();
                },
                child: const Text("Siteye Git")),
          ],
        ),
      ),
    );
  }
}
