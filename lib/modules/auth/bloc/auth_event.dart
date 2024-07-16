part of 'auth_bloc.dart';

abstract class AuthEvent {}

class GoogleLoginEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}
