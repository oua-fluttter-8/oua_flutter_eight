// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:oua_flutter_eight/models/location_model.dart';
import 'package:oua_flutter_eight/presentation/screens/ayarlar_ekrani/ayarlar_ekrani.dart';
import 'package:oua_flutter_eight/presentation/screens/lokasyon/location_details_page.dart';
import 'package:oua_flutter_eight/presentation/screens/onboarding_screen_design/onboarding_screen.dart';
import 'package:oua_flutter_eight/presentation/screens/profile/profile_page.dart';
import 'package:oua_flutter_eight/presentation/screens/search_page/search_page.dart';
import 'package:oua_flutter_eight/presentation/screens/sign/sign_in_page.dart';
import 'package:oua_flutter_eight/presentation/screens/sign/sign_up_page.dart';
import 'package:oua_flutter_eight/presentation/screens/splash/splash_screen.dart';
import '../../presentation/screens/favorites/favorites.dart';
import '../../presentation/screens/home/home_page.dart';
import '../../presentation/screens/profile/edit_profile_page.dart';
import '../components/bottom_navbar/custom_bottom_navbar.dart';
import '../constants/route_constants.dart';

class CustomRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case signInRoute:
        return MaterialPageRoute(
          builder: (_) => const SignInPage(),
        );
      case signUpRoute:
        return MaterialPageRoute(
          builder: (_) => const SignUpPage(),
        );
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case profileRoute:
        return MaterialPageRoute(
          builder: (_) => const ProfilePage(),
        );
      case editProfileRoute:
        return MaterialPageRoute(
          builder: (_) => const EditProfilePage(),
        );
      case onboardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
        );
      case settingsRoute:
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
        );
      case searchRoute:
        return MaterialPageRoute(
          builder: (_) => const SearchPage(),
        );
      case favoritesRoute:
        return MaterialPageRoute(
          builder: (_) => const FavoritesPage(),
        );
      case placeDetailRoute:
        return MaterialPageRoute(
          builder: (_) => LocationDetailsPage(
            location: args as LocationModel,
          ),
        );
      case navbarRoute:
        return MaterialPageRoute(
          builder: (_) => const BottomNavBar(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Page404(),
        );
    }
  }
}

class Page404 extends StatelessWidget {
  const Page404({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("404 Page Not Found"));
  }
}
