import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/location/location_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/location/location_state.dart';
import 'package:oua_flutter_eight/logic/blocs/user/user_bloc.dart';
import 'package:oua_flutter_eight/models/location_model.dart';

import '../../../core/components/appbar/custom_app_bar.dart';
import '../../../core/components/location_card/location_card.dart';
import '../../../logic/blocs/user/user_event.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String categoryIndex = "Eski kalıntılar";
  @override
  Widget build(BuildContext context) {
    List<LocationModel>? locations;

    final locationState = context.read<LocationBloc>().state;
    if (locationState is LocationLoaded) {
      locations = locationState.locations;
    } else {
      locations = [];
    }
    final allCategory = splitListByCity(locations);
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: "Keşfet",
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      categoryIndex = category[index]["key"];
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage(category[index]["icon"]),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            category[index]["name"],
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 25,
            child: ListView.builder(
                itemCount: allCategory[categoryIndex]!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/place_detail",
                          arguments: allCategory[categoryIndex]![index]);
                    },
                    child: PlaceCardsWidget(
                      onPressed: () {
                        context.read<UserBloc>().add(AddFavoriteLocationEvent(
                              locationId:
                                  allCategory[categoryIndex]![index].locationId,
                            ));
                      },
                      locationImage:
                          allCategory[categoryIndex]![index].locationPhotoUrl,
                      locationName:
                          allCategory[categoryIndex]![index].locationName,
                      locationCity:
                          allCategory[categoryIndex]![index].locationCity,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

Map<String, List<LocationModel>> splitListByCity(
    List<LocationModel> locations) {
  // Dört ayrı liste için boş bir map oluşturun
  Map<String, List<LocationModel>> result = {
    "Eski kalıntılar": [],
    "Kutsal ve dini yerler": [],
    "Müzeler": [],
    "Parklar": [],
    "Tarihi Yer": [],
  };

  // locations listesini dolaşarak her bir elemanı city özelliğine göre ilgili listeye ekleyin
  for (var location in locations) {
    String category = location.locationCategory;
    if (result.containsKey(category)) {
      result[category]!.add(location);
    }
  }

  return result;
}

List<Map<String, dynamic>> category = [
  {
    "name": "Eski Kalıntılar",
    "icon": "assets/jpg/kalinti.jpg",
    "key": "Eski kalıntılar",
  },
  {
    "name": "Kutsal Yerler",
    "icon": "assets/jpg/kutsal.jpg",
    "key": "Kutsal ve dini yerler",
  },
  {
    "name": "Müzeler",
    "icon": "assets/jpg/muze.jpg",
    "key": "Müzeler",
  },
  {
    "name": "Parklar",
    "icon": "assets/jpg/park.jpg",
    "key": "Parklar",
  },
  {
    "name": "Tarihi Yerler",
    "icon": "assets/jpg/tarihi.jpg",
    "key": "Tarihi Yer",
  },
];
