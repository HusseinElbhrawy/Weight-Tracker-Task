import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/core/utils/app_colors.dart';
import 'package:weight_tracker/core/utils/media_query_values.dart';
import 'package:weight_tracker/features/weight/presentation/cubit/weight_cubit.dart';

class WeightEntryWidget extends StatelessWidget {
  const WeightEntryWidget({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final WeightCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: context.height / 4,
          width: context.width,
          margin: const EdgeInsetsDirectional.only(
            top: 16,
            end: 16,
            start: 16,
            bottom: 21,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadiusDirectional.circular(8),
          ),
          child: BlocBuilder<WeightCubit, WeightState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: cubit.sliderValue.toStringAsFixed(0),
                          style: Theme.of(context).textTheme.headlineLarge,
                          children: [
                            TextSpan(
                              text: 'KG',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Slider.adaptive(
                    min: 0.0,
                    max: 200,
                    value: cubit.sliderValue,
                    activeColor: Colors.red,
                    onChanged: (newValue) => cubit.changeSliderValue(newValue),
                  ),
                ],
              );
            },
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            cubit.saveData(cubit.sliderValue.roundToDouble());
          },
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
