import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/location/location_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/location/location_event.dart';

import '../../../logic/blocs/location/location_state.dart';

class LocationTest extends StatefulWidget {
  const LocationTest({super.key});

  @override
  State<LocationTest> createState() => _LocationTestState();
}

class _LocationTestState extends State<LocationTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(builder: (context, state) {
        if (state is LocationInitial) {
          context.read<LocationBloc>().add(FetchLocation());
        } else if (state is LocationLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LocationLoaded) {
          return ListView.builder(
            itemCount: state.locations.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.locations[index].locationName),
                subtitle: Text(state.locations[index].locationDescription),
              );
            },
          );
        } else if (state is LocationError) {
          return Center(
            child: Text(state.message),
          );
        } else {}
        return Container();
      }),
    );
  }
}
