import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac/configs/service_locator/service_locator.dart';
import 'package:tic_tac/data/models/user/user_model.dart';
import 'package:tic_tac/modules/auth/reposiotry/authenticaion_repsitory.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    //Handles the google login with login event
    on<GoogleLoginEvent>((event, emit) async {
      try {
        log("GoogleLoginEvent Received");
        await _authenticaionRepsitory.signInWithGoogle();
        emit(state.copyWith(authStateEnum: AuthStateEnum.success));
        log('Logged In');
      } on FirebaseException catch (e) {
        log("FirebaseException: ${e.toString()}");
        emit(state.copyWith(
            authStateEnum: AuthStateEnum.failed, errorMessage: e.toString()));
      } on Exception catch (e) {
        log("Eseption: ${e.toString()}");
        emit(state.copyWith(
            authStateEnum: AuthStateEnum.failed, errorMessage: e.toString()));
      }
    });

    on<SignOutEvent>((event, emit) async {
      try {
        await _authenticaionRepsitory.singOut();
        emit(state.copyWith(
            authStateEnum: AuthStateEnum.loggedOut,
            successMessage: "Logged Out"));
      } catch (e) {
        log("SignOut Exception: ${e.toString()}");
        emit(state.copyWith(
            authStateEnum: AuthStateEnum.failed, errorMessage: e.toString()));
      }
    });
  }

  final AuthenticaionRepsitory _authenticaionRepsitory =
      getIt.get<AuthenticaionRepsitory>();
}
