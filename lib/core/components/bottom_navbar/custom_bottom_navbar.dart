import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  List<IconData> navIcons = [
    Icons.home_outlined,
    Icons.search_rounded,
    Icons.favorite_outline_rounded,
    Icons.person_outline_rounded,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: const EdgeInsets.only(
        right: 24,
        left: 24,
        bottom: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: navIcons.asMap().entries.map((entry) {
          int index = entry.key;
          IconData icon = entry.value;
          bool isSelected = selectedIndex == index;
          return Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                        top: 20, bottom: 0, left: 25, right: 25),
                    child: Icon(icon,
                        color: isSelected ? Colors.red : Colors.white),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
