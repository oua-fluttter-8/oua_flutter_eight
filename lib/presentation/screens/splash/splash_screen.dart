import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oua_flutter_eight/logic/blocs/auth/auth_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/auth/auth_event.dart';

import '../../../logic/blocs/auth/auth_state.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      _redirectUser();
    });
  }

  void _redirectUser() {
    final state = context.read<AuthBloc>().state;
    if (state is AuthInitial) {
      context.read<AuthBloc>().add(AuthAppStarted());
    } else if (state is AuthError) {
      // Handle AuthError if needed
    } else if (state is Authenticated) {
      Navigator.pushReplacementNamed(context, "/navbar");
    } else if (state is Unauthenticated) {
      Navigator.pushReplacementNamed(context, "/onboarding");
    } else if (state is AuthLoading) {
      // Handle AuthLoading if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            SvgPicture.asset(
              "assets/svg/logo.svg",
              semanticsLabel: 'Acme Logo',
              height: 150,
              width: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            SvgPicture.asset(
              "assets/svg/mekAN.svg",
              semanticsLabel: 'Acme Logo',
              height: 50,
              width: 50,
            ),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(
              height: 20,
            ),
            const Text('Yükleniyor...'),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
