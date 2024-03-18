import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oua_flutter_eight/presentation/screens/favorites/favorites.dart';
import 'package:oua_flutter_eight/presentation/screens/home/home_page.dart';
import 'package:oua_flutter_eight/presentation/screens/profile/profile_page.dart';
import 'package:oua_flutter_eight/presentation/screens/search_page/search_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarFb5State();
}

class _BottomNavBarFb5State extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    // Ekranları burada listeleyin
    const HomePage(),
    const SearchPage(),
    const FavoritesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconBottomBar(
                  text: "Anasayfa",
                  icon: FontAwesomeIcons.house,
                  selected: _selectedIndex == 0 ? true : false,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  }),
              IconBottomBar(
                  text: "Keşfet",
                  icon: FontAwesomeIcons.magnifyingGlass,
                  selected: _selectedIndex == 1 ? true : false,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  }),
              IconBottomBar(
                  text: "Favorilerim",
                  icon: FontAwesomeIcons.heart,
                  selected: _selectedIndex == 2 ? true : false,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  }),
              IconBottomBar(
                  text: "Profil",
                  icon: FontAwesomeIcons.userGroup,
                  selected: _selectedIndex == 3 ? true : false,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  }),
            ],
          ),
        ));
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {super.key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed});
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon,
              size: 25, color: selected ? Colors.orange : Colors.grey),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              height: .1,
              color: selected ? Colors.orange : Colors.grey),
        )
      ],
    );
  }
}
