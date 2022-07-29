import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/config/routes/app_routes.dart';
import 'package:weight_tracker/config/themes/light_theme.dart';
import 'package:weight_tracker/core/utils/app_strings.dart';
import 'package:weight_tracker/features/injector.dart';
import 'package:weight_tracker/features/login/presentation/cubit/login_cubit.dart';
import 'package:weight_tracker/features/weight/presentation/cubit/weight_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => serviceLocator<LoginCubit>(),
        ),
        BlocProvider<WeightCubit>(
          create: (BuildContext context) => serviceLocator<WeightCubit>(),
        ),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        theme: lightTheme(context),
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
