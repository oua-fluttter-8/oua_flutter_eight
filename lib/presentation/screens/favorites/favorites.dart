//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/user/user_event.dart';
import 'package:oua_flutter_eight/logic/blocs/user/user_state.dart';

import '../../../core/components/appbar/custom_app_bar.dart';
import '../../../core/components/location_card/location_card.dart';
import '../../../logic/blocs/location/location_bloc.dart';
import '../../../logic/blocs/location/location_state.dart';
import '../../../logic/blocs/user/user_bloc.dart';
import '../../../models/location_model.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late String userId;
  List<LocationModel>? locations;
  List<LocationModel> favoriteLocations = [];
  List<String> favoriteLocationIds = [];
  @override
  Widget build(BuildContext context) {
    final authState = context.read<UserBloc>().state;
    final locationState = context.read<LocationBloc>().state;
    final userState = context.watch<UserBloc>().state;
    if (authState is UserFetchedState) {
      userId = authState.user!.uid;
    } else {
      userId = " ";
    }
    if (userState is UserFetchedState) {
      favoriteLocationIds = userState.user!.favoriteLocations!;
    } else {
      favoriteLocationIds = [];

      context.read<UserBloc>().add(UserFetchEvent(userId: userId));
    }
    if (locationState is LocationLoaded) {
      locations = locationState.locations;
    } else {
      locations = [];
    }
    favoriteLocations = getFavoriteLocations(favoriteLocationIds, locations!);
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: "Favorilerim",
      ),
      body: Column(
        children: [
          Expanded(
            flex: 25,
            child: ListView.builder(
                itemCount: favoriteLocations.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/place_detail",
                          arguments: favoriteLocations[index]);
                    },
                    child: PlaceCardsWidget(
                      onPressed: null,
                      deleteOnPressed: () {
                        setState(() {
                          context.read<UserBloc>().add(
                              DeleteFavoriteLocationEvent(
                                  locationId:
                                      favoriteLocations[index].locationId));
                          favoriteLocations.removeAt(index);
                        });
                      },
                      locationImage: favoriteLocations[index].locationPhotoUrl,
                      locationName: favoriteLocations[index].locationName,
                      locationCity: favoriteLocations[index].locationCity,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

List<LocationModel> getFavoriteLocations(
    List<String> favoriteLocationIds, List<LocationModel> allLocations) {
  List<LocationModel> favoriteLocations = [];

  // Tüm konumları döngüye alarak favori ID'lerle karşılaştırın
  for (var location in allLocations) {
    // Konumun ID'si favori ID'ler listesinde varsa, bu konumu favori konumlar listesine ekleyin
    if (favoriteLocationIds.contains(location.locationId)) {
      favoriteLocations.add(location);
    }
  }

  return favoriteLocations;
}
