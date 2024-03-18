//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../core/components/appbar/custom_app_bar.dart';
import '../../../core/components/bottom_navbar/custom_bottom_navbar.dart';
import '../../../core/components/location_card/location_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 35),
            child: AppBarWidget(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
            child: Text(
              "Favori Yerlerim",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  for (int i = 0; i < 10; i++) PlaceCardsWidget(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBarWidget(),
          ),
        ],
      ),
    );
  }
}
