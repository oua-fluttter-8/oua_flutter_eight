import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oua_flutter_eight/presentation/screens/splash/splash_screen.dart';

import '../../../core/components/toast/custom_toast.dart';
import '../../../logic/blocs/auth/auth_bloc.dart';
import '../../../logic/blocs/auth/auth_event.dart';
import '../../../logic/blocs/auth/auth_state.dart';

class AuthControlPage extends StatefulWidget {
  const AuthControlPage({super.key});

  @override
  State<AuthControlPage> createState() => _AuthControlPageState();
}

class _AuthControlPageState extends State<AuthControlPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          context.read<AuthBloc>().add(AuthAppStarted());
          return const SplashScreen();
        } else if (state is AuthLoading) {
          return const SplashScreen();
        } else if (state is AuthError) {
          ToastHelper.showErrorToast(state.errorMessage);
          return const SplashScreen();
        } else if (state is Unauthenticated) {
          return const SplashScreen();
        } else if (state is Authenticated) {
          return const SplashScreen();
        } else {
          return Container();
        }
      },
    );
  }
}
