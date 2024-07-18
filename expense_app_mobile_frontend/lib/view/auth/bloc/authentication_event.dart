part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class GetUserInfoEvent extends AuthenticationEvent {
  final String userId;
  const GetUserInfoEvent({required this.userId});

  @override
  List<Object> get props => [];
}

class GoogleLoginEvent extends AuthenticationEvent {
  const GoogleLoginEvent();

  @override
  List<Object> get props => [];
}

class LogoutUserEvent extends AuthenticationEvent {
  const LogoutUserEvent();

  @override
  List<Object> get props => [];
}

class LoginUserWithEmailAndPassword extends AuthenticationEvent {
  final String email;
  final String password;
  const LoginUserWithEmailAndPassword({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class RegisterUserEvent extends AuthenticationEvent {
  final String fullName;
  final String email;
  final int? mobileNo;
  final String password;

  const RegisterUserEvent({
    required this.fullName,
    required this.email,
    this.mobileNo,
    required this.password,
  });

  @override
  List<Object> get props => [fullName, email, mobileNo ?? '', password];
}

class UpdateUserEvent extends AuthenticationEvent {
  final String fullName;
  final String? email;
  final String mobileNo;

  final String? address;
  final String? country;

  final String? state;
  final String? city;

  final int pinCode;

  const UpdateUserEvent({
    required this.fullName,
    this.email,
    required this.mobileNo,
    this.address,
    this.state,
    this.city,
    this.country,
    required this.pinCode,
  });

  @override
  List<Object> get props => [fullName, mobileNo, pinCode];
}

class ChangeUserTypeEvent extends AuthenticationEvent {
  final String? societyId;
  final String? userId;
  final String userType;

  const ChangeUserTypeEvent({
    required this.userType,
    required this.societyId,
    required this.userId,
  });

  @override
  List<Object> get props => [societyId ?? '', userId ?? '', userType];
}
