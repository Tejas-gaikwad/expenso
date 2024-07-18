part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class UpdateUserLoadingState extends AuthenticationState {}

class AuthenticationRemoveLoaderState extends AuthenticationState {}

class AuthenticationSuccessfulState extends AuthenticationState {
  final UserDataModel userData;
  const AuthenticationSuccessfulState({required this.userData});

  @override
  List<Object> get props => [userData];
}

class LogoutSuccessfulState extends AuthenticationState {
  const LogoutSuccessfulState();

  @override
  List<Object> get props => [];
}

class UserDataLoadingState extends AuthenticationState {
  const UserDataLoadingState();

  @override
  List<Object> get props => [];
}

class UserDataLoadedState extends AuthenticationState {
  final UserDataModel userData;
  const UserDataLoadedState({required this.userData});

  @override
  List<Object> get props => [userData];
}

class AuthenticationErrorState extends AuthenticationState {}

class AuthenticationNavigationState extends AuthenticationState {}

class LogoutNavigationState extends AuthenticationState {}

class LogoutErrorState extends AuthenticationState {}

class UserRegisterSuccessfulState extends AuthenticationState {
  final UserDataModel userData;
  const UserRegisterSuccessfulState({required this.userData});
}

class UserUpdateSuccessfulState extends AuthenticationState {}

class UserRegisterErrorState extends AuthenticationState {
  final String error;
  const UserRegisterErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class UserUpdateErrorState extends AuthenticationState {
  final String error;
  const UserUpdateErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class RegisterSuccessfulUserNavigationState extends AuthenticationState {
  final String userID;
  const RegisterSuccessfulUserNavigationState({required this.userID});
}

class UserLoginErrorState extends AuthenticationState {
  final String errorMessage;
  const UserLoginErrorState({required this.errorMessage});
}

class LogoutUserState extends AuthenticationState {}

class ChangeUserTypeLoadingState extends AuthenticationState {
  const ChangeUserTypeLoadingState();

  @override
  List<Object> get props => [];
}

class ChangeUserTypeDoneState extends AuthenticationState {
  const ChangeUserTypeDoneState();

  @override
  List<Object> get props => [];
}

class GoogleLoginLoadingState extends AuthenticationState {}

class NewGoogleLoginSuccessfulState extends AuthenticationState {
  final UserDataModel userData;
  const NewGoogleLoginSuccessfulState({required this.userData});
}

class GoogleLoginSuccessfulState extends AuthenticationState {
  final UserDataModel userData;
  const GoogleLoginSuccessfulState({required this.userData});
}

class GoogleLoginErrorState extends AuthenticationState {
  final String errorMessage;
  const GoogleLoginErrorState({required this.errorMessage});
}
