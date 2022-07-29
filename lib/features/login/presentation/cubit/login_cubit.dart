import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weight_tracker/config/routes/app_routes.dart';
import 'package:weight_tracker/core/error/errors.dart';
import 'package:weight_tracker/core/error/exceptions.dart';
import 'package:weight_tracker/core/usecases/usecases.dart';
import 'package:weight_tracker/features/login/domain/usecases/log_out_usecase.dart';
import 'package:weight_tracker/features/login/domain/usecases/sign_in_anny_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.logOutUseCase,
    required this.signInAnonymousUseCase,
  }) : super(LoginInitial());

  final SignInAnonymousUseCase signInAnonymousUseCase;
  final LogOutUseCase logOutUseCase;

  bool isLoading = false;
  Future<void> logOut(context) async {
    emit(SignOutLoading());
    final response = await logOutUseCase.call(NoParams());
    emit(
      response.fold(
        (failure) => SignOutError(failure),
        (response) => SignOutSuccess(),
      ),
    );
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  Future<void> signInAnonymous(context) async {
    emit(SignInLoading());
    isLoading = true;
    final response = await signInAnonymousUseCase(NoParams());

    emit(
      response.fold(
        (failure) => SignInError(failure),
        (response) => SignInSuccess(response.user!.uid.toString()),
      ),
    );
    isLoading = false;
    Navigator.pushReplacementNamed(context, Routes.homeRoute);
  }
}
