part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class SignInLoading extends LoginState {}

class SignInError extends LoginState {
  final Failure exception;

  SignInError(this.exception);
}

class SignInSuccess extends LoginState {
  final String userCredential;

  SignInSuccess(this.userCredential);
}

class SignOutLoading extends LoginState {}

class SignOutError extends LoginState {
  final Failure exception;

  SignOutError(this.exception);
}

class SignOutSuccess extends LoginState {}

class GetCachedDataLoading extends LoginState {}

class GetCachedDataSuccess extends LoginState {
  final bool value;

  GetCachedDataSuccess(this.value);
}

class GetCachedDataError extends LoginState {
  final CachedException exception;

  GetCachedDataError(this.exception);
}
