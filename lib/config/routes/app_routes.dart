import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:weight_tracker/core/utils/app_colors.dart';
import 'package:weight_tracker/core/utils/app_strings.dart';
import 'package:weight_tracker/core/utils/assets_manger.dart';
import 'package:weight_tracker/core/utils/media_query_values.dart';
import 'package:weight_tracker/features/login/presentation/screens/login_screen.dart';
import 'package:weight_tracker/features/weight/presentation/screens/weight_screen.dart';

class Routes {
  static const String initRoute = '/';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initRoute:
        return MaterialPageRoute(
          builder: (context) => SplashScreenView(
            navigateRoute: LoginScreen(),
            duration: 5000,
            imageSize: 130,
            imageSrc: ImageAssets.weightPNG,
            text: AppStrings.appName,
            textType: TextType.ColorizeAnimationText,
            textStyle: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.bold),
            colors: [
              context.isDarkTheme ? Colors.white : AppColors.primaryColor,
              Colors.blue,
              Colors.blueGrey,
            ],
            backgroundColor:
                context.isDarkTheme ? AppColors.primaryColor : Colors.white,
          ),
        );

      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => WeightScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      default:
        return null;
    }
  }
}
