//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../core/components/appbar/custom_app_bar.dart';
import '../../../core/components/bottom_navbar/custom_bottom_navbar.dart';
import '../../../core/components/location_card/location_card.dart';
import '../../widgets/search_page/category_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
              "Kategoriler",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          CategoryWidget(),

          /*Container(height: 115,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0,top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height:80 ,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child:ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                   child: Image(
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    image: AssetImage("lib/assets/images/wiew.png"),
                    )
                    ),
              

                      

                      ),
                      Text("Dağ", style: TextStyle(fontSize: 13,),
                      textAlign: TextAlign.center ,)
                    ],
                  ),
                ),
              ],),
            ),*/

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
