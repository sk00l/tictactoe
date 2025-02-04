import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac/configs/router/app_router.dart';
import 'package:tic_tac/configs/service_locator/service_locator.dart';
import 'package:tic_tac/constants/app_color.dart';
import 'package:tic_tac/data/models/game/game_state.dart';
import 'package:tic_tac/firebase_options.dart';
import 'package:tic_tac/modules/auth/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthBloc(),
      ),
      ChangeNotifierProvider(create: (context) => GameState()),
    ],
    child: const MyApp(),
  ));

  setup();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(AppColor.backgroundColor)),
    );
  }
}
