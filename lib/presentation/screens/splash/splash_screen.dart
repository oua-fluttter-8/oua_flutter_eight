import 'package:flutter/material.dart';

import '../../widgets/splash/splash_screen_widget.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SplashTextWidget(),
      ),
    );
  }
}

