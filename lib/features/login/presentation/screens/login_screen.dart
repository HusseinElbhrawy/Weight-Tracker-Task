import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/core/utils/app_colors.dart';
import 'package:weight_tracker/features/login/presentation/cubit/login_cubit.dart';
import 'package:weight_tracker/features/login/presentation/widgets/loading_widget.dart';
import 'package:weight_tracker/features/login/presentation/widgets/login_wdiget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen() : super();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: !BlocProvider.of<LoginCubit>(context).isLoading
              ? FloatingActionButton(
                  onPressed: () async {
                    await BlocProvider.of<LoginCubit>(context)
                        .signInAnonymous(context);
                  },
                  child: Text('Login'),
                  backgroundColor: AppColors.primaryColor,
                )
              : SizedBox.shrink(),
          body: Stack(
            children: [
              LoginWidget(),
              LoadingWidget(),
            ],
          ),
        );
      },
    );
  }
}
