import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oua_flutter_eight/core/routes/custom_routes.dart';
import 'package:oua_flutter_eight/logic/blocs/auth/auth_bloc.dart';
import 'package:oua_flutter_eight/logic/repositories/auth_repository.dart';
import 'package:oua_flutter_eight/logic/repositories/user_repository.dart';
import 'package:oua_flutter_eight/presentation/screens/auth_controller/auth_controller.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc(AuthRepository(), UserRepository())),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Scaffold(
      //   body: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Image(image: AssetImage('assets')),
      //         Text('Hello World'),
      //       ],
      //     ),
      //   ),
      // ),
      onGenerateRoute: CustomRoutes.generateRoute,
      home: AuthControlPage(),
    );
  }
}
