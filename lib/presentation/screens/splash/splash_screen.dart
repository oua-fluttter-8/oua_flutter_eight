import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/auth/auth_bloc.dart';
import 'package:oua_flutter_eight/logic/blocs/auth/auth_event.dart';

import '../../../logic/blocs/auth/auth_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthInitial) {
                context.read<AuthBloc>().add(AuthAppStarted());
              } else if (state is AuthError) {
              } else if (state is Authenticated) {
                Navigator.pushReplacementNamed(context, "/home",
                    arguments: state.userId);
              } else if (state is Unauthenticated) {
                Navigator.pushReplacementNamed(context, "/sign_in");
              } else if (state is AuthLoading) {}
            },
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Loading...'),
                ],
              ),
            )));
  }
}
