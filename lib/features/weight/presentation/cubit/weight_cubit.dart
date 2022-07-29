import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weight_tracker/core/utils/app_strings.dart';
import 'package:weight_tracker/features/weight/domain/usecases/delete_weight_usecase.dart';
import 'package:weight_tracker/features/weight/domain/usecases/saved_weight_usecase.dart';
import 'package:weight_tracker/features/weight/domain/usecases/update_weight_usecase.dart';

part 'weight_state.dart';

class WeightCubit extends Cubit<WeightState> {
  WeightCubit({
    required this.savedDataUseCase,
    required this.deleteWeightUseCase,
    required this.updateWeightUseCase,
  }) : super(WeightInitial());

  final SavedWeightUseCase savedDataUseCase;
  final DeleteWeightUseCase deleteWeightUseCase;
  final UpdateWeightUseCase updateWeightUseCase;

  final key = GlobalKey<FormState>();
  final TextEditingController newWeightController = TextEditingController();

  Future saveData(double weight) async {
    emit(SaveWeightLoading());
    final response = await savedDataUseCase(weight);
    response.fold(
      (failure) => SaveWeightError(),
      (value) => SaveWeighSuccess(),
    );
  }

  Future deleteWeight(String docsId) async {
    emit(DeleteWeightLoading());
    final response = await deleteWeightUseCase(docsId);
    response.fold(
      (failure) => DeleteWeightError(),
      (value) => DeleteWeighSuccess(),
    );
  }

  Future updateWeight(String docsId, double newWeight) async {
    emit(UpdateWeightLoading());
    final response = await updateWeightUseCase(
      {
        AppStrings.docsId: docsId,
        AppStrings.weight: newWeight,
      },
    );
    response.fold(
      (failure) => UpdateWeightError(),
      (value) => UpdateWeighSuccess(),
    );
  }

  double sliderValue = 50;
  void changeSliderValue(double newValue) {
    emit(StartChangeSliderValue());
    sliderValue = newValue;
    emit(EndChangeSliderValue());
  }
}
