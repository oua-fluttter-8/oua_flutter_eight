//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../core/components/appbar/custom_app_bar.dart';
import '../../../core/components/bottom_navbar/custom_bottom_navbar.dart';
import '../../../core/components/tabbar/custom_tabbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        AppBarWidget(),
        Container(
          child: Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text("Muhteşem Türkiye",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: 'Poppins',
                  ))),
        ),
        Padding(
            padding: EdgeInsets.only(top: 5, left: 20, bottom: 15),
            child: Text("Hadi Birlikte Keşfedelim",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                ))),
        Align(
          alignment: Alignment.bottomCenter,
          child: TabBarWidget(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomNavigationBarWidget(),
        )
      ],
    ));
  }
}
