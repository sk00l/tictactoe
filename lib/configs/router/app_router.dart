import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac/screen/game_screen.dart';
import 'package:tic_tac/screen/home_screen.dart';
import 'package:tic_tac/screen/login_screen.dart';
import 'package:tic_tac/screen/shared/firebase_user.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: "/",
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
        redirect: (context, state) {
          final User? user = getCurrentUser();

          return user != null ? '/home' : null;
        },
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
        redirect: (context, state) {
          final User? user = getCurrentUser();
          return user == null ? '/' : null;
        },
      ),
      GoRoute(
        path: '/game',
        builder: (context, state) => const GameScreen(),
      ),
    ],
  );
}
