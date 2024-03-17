import 'package:flutter/material.dart';
import 'package:oua_flutter_eight/presentation/screens/home/home_screen.dart';
import 'package:oua_flutter_eight/presentation/screens/profile/profile_page.dart';
import 'package:oua_flutter_eight/presentation/screens/sign/sign_in_page.dart';
import 'package:oua_flutter_eight/presentation/screens/sign/sign_up_page.dart';
import 'package:oua_flutter_eight/presentation/screens/splash/splash_screen.dart';
import '../../presentation/screens/profile/edit_profile_page.dart';
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
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            userId: args as String,
          ),
        );
      case profileRoute:
        return MaterialPageRoute(
          builder: (_) => const ProfilePage(),
        );
      case editProfileRoute:
        return MaterialPageRoute(
          builder: (_) => const EditProfilePage(),
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
