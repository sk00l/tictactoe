// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

enum AuthStateEnum {
  initial,
  loading,
  success,
  failed,
  loggingOut,
  loggedOut,
}

class AuthState extends Equatable {
  final AuthStateEnum? authStateEnum;
  final UserModel? userModel;
  final String? errorMessage;
  final String? successMessage;
  const AuthState({
    this.authStateEnum,
    this.userModel,
    this.errorMessage,
    this.successMessage,
  });

  @override
  List<Object?> get props =>
      [authStateEnum, userModel, errorMessage, successMessage];

  AuthState copyWith({
    AuthStateEnum? authStateEnum,
    UserModel? userModel,
    String? errorMessage,
    String? successMessage,
  }) {
    return AuthState(
      authStateEnum: authStateEnum ?? this.authStateEnum,
      userModel: userModel ?? this.userModel,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
    );
  }
}
