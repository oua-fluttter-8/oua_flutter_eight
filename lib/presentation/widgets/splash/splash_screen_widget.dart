import 'package:flutter/material.dart';

class SplashTextWidget extends StatelessWidget {
  const SplashTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Splash Screen',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}