import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weight_tracker/core/utils/app_colors.dart';
import 'package:weight_tracker/core/utils/app_strings.dart';
import 'package:weight_tracker/core/utils/assets_manger.dart';
import 'package:weight_tracker/core/utils/media_query_values.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
            height: context.height,
            width: context.width,
            child: SvgPicture.asset(ImageAssets.weightSVG),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.appName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: AppColors.primaryColor),
                ),
                Text(
                  'There are only way to enter , login Anonymous',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: AppColors.hint,
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
