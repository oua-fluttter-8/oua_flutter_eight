// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import '../location_card/location_card.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 3 / 5,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.red,
            indicatorColor: Colors.red,
            dividerColor: Colors.transparent,
            //isScrollable: true,
            //onTap: (secilenIndex) {},
            tabs: const [
              Tab(child: Text("İstanbul")),
              Tab(child: Text("Aydın")),
              Tab(child: Text("Trabzon")),
              Tab(child: Text("Mardin")),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                PlaceCardsWidget(),
                PlaceCardsWidget(),
                PlaceCardsWidget(),
                PlaceCardsWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
