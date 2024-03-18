import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/location/location_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/location/location_event.dart';
import 'package:oua_flutter_eight/logic/blocs/user/user_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/user/user_event.dart';

import '../../../logic/blocs/location/location_state.dart';
import '../../../models/location_model.dart';
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
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state is LocationInitial) {
          context.read<LocationBloc>().add(FetchLocation());
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LocationLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LocationError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is LocationLoaded) {
          final allCity = splitListByCity(state.locations);

          return Column(
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
                  children: [
                    ListView.builder(
                        itemCount: allCity["İstanbul"]!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/place_detail",
                                  arguments: allCity["İstanbul"]![index]);
                            },
                            child: PlaceCardsWidget(
                              onPressed: () {
                                context.read<UserBloc>().add(
                                    AddFavoriteLocationEvent(
                                        locationId: allCity["İstanbul"]![index]
                                            .locationId));
                              },
                              locationImage:
                                  allCity["İstanbul"]![index].locationPhotoUrl,
                              locationName:
                                  allCity["İstanbul"]![index].locationName,
                              locationCity:
                                  allCity["İstanbul"]![index].locationCity,
                            ),
                          );
                        }),
                    ListView.builder(
                        itemCount: allCity["Aydın"]!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/place_detail",
                                  arguments: allCity["Aydın"]![index]);
                            },
                            child: PlaceCardsWidget(
                              onPressed: () {
                                context.read<UserBloc>().add(
                                    AddFavoriteLocationEvent(
                                        locationId: allCity["Aydın"]![index]
                                            .locationId));
                              },
                              locationImage:
                                  allCity["Aydın"]![index].locationPhotoUrl,
                              locationName:
                                  allCity["Aydın"]![index].locationName,
                              locationCity:
                                  allCity["Aydın"]![index].locationCity,
                            ),
                          );
                        }),
                    ListView.builder(
                        itemCount: allCity["Trabzon"]!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/place_detail",
                                  arguments: allCity["Trabzon"]![index]);
                            },
                            child: PlaceCardsWidget(
                              onPressed: () {
                                context.read<UserBloc>().add(
                                    AddFavoriteLocationEvent(
                                        locationId: allCity["Trabzon"]![index]
                                            .locationId));
                              },
                              locationImage:
                                  allCity["Trabzon"]![index].locationPhotoUrl,
                              locationName:
                                  allCity["Trabzon"]![index].locationName,
                              locationCity:
                                  allCity["Trabzon"]![index].locationCity,
                            ),
                          );
                        }),
                    ListView.builder(
                        itemCount: allCity["Mardin"]!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/place_detail",
                                  arguments: allCity["Mardin"]![index]);
                            },
                            child: PlaceCardsWidget(
                              onPressed: () {
                                context.read<UserBloc>().add(
                                    AddFavoriteLocationEvent(
                                        locationId: allCity["Mardin"]![index]
                                            .locationId));
                              },
                              locationImage:
                                  allCity["Mardin"]![index].locationPhotoUrl,
                              locationName:
                                  allCity["Mardin"]![index].locationName,
                              locationCity:
                                  allCity["Mardin"]![index].locationCity,
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text("Else"),
          );
        }
      },
    );
  }
}

Map<String, List<LocationModel>> splitListByCity(
    List<LocationModel> locations) {
  // Dört ayrı liste için boş bir map oluşturun
  Map<String, List<LocationModel>> result = {
    "İstanbul": [],
    "Aydın": [],
    "Mardin": [],
    "Trabzon": [],
  };

  // locations listesini dolaşarak her bir elemanı city özelliğine göre ilgili listeye ekleyin
  for (var location in locations) {
    String city = location.locationCity;
    if (result.containsKey(city)) {
      result[city]!.add(location);
    }
  }

  return result;
}
