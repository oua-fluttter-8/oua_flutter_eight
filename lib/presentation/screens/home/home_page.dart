//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/appbar/custom_app_bar.dart';
import '../../../core/components/tabbar/custom_tabbar.dart';
import '../../../logic/blocs/auth/auth_bloc.dart';
import '../../../logic/blocs/auth/auth_state.dart';
import '../../../logic/blocs/user/user_bloc.dart';
import '../../../logic/blocs/user/user_event.dart';
import '../../../logic/blocs/user/user_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String userId = "";
    final authState = context.read<AuthBloc>().state;
    if (authState is Authenticated) {
      userId = authState.userId!;
    } else {
      userId = " ";
    }
    return Scaffold(
      appBar: CustomAppBarWidget(),
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserInitialState) {
          if (userId.isEmpty) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('Boş'),
                ),
              ],
            );
          } else {
            context.read<UserBloc>().add(UserFetchEvent(userId: userId));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserFetchLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserFetchErrorState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is UserFetchedState) {
          return SafeArea(
            top: false,
            bottom: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hoşgeldin ${state.user!.nameSurname.split(" ")[0]}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'Poppins',
                    )),
                Text("Hadi Birlikte Keşfedelim",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    )),
                Expanded(child: TabBarWidget()),
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
