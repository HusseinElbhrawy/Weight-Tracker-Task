import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/core/utils/app_colors.dart';
import 'package:weight_tracker/features/login/presentation/cubit/login_cubit.dart';

class LoginFloatingActionButton extends StatelessWidget {
  const LoginFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await BlocProvider.of<LoginCubit>(context).signInAnonymous(context);
      },
      child: Text('Login'),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
