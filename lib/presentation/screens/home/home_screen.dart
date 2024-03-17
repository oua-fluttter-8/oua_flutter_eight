import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/auth/auth_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/auth/auth_event.dart';
import 'package:oua_flutter_eight/logic/blocs/auth/auth_state.dart';
import 'package:oua_flutter_eight/logic/blocs/user/user_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/user/user_event.dart';

import '../../../logic/blocs/user/user_state.dart';

class HomeScreen extends StatefulWidget {
  final String userId;
  const HomeScreen({super.key, required this.userId});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          Navigator.pushReplacementNamed(context, "/sign_in");
        } else if (state is AuthError) {
          Navigator.pushReplacementNamed(context, "/sign_in");
        } else if (state is Authenticated) {}
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitialState) {
            if (widget.userId.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text('Boş'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLogout());
                    },
                    child: const Text('Sign Out'),
                  ),
                ],
              );
            } else {
              context
                  .read<UserBloc>()
                  .add(UserFetchEvent(userId: widget.userId));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserFetchLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserFetchErrorState) {
            return const Center(
              child: Text('Error'),
            );
          } else if (state is UserFetchedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Home Screen'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/profile");
                    },
                    child: const Text("Profil"))
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
