part of 'weight_cubit.dart';

abstract class WeightState extends Equatable {
  const WeightState();

  @override
  List<Object> get props => [];
}

class WeightInitial extends WeightState {}

class SaveWeightLoading extends WeightState {}

class SaveWeightError extends WeightState {}

class SaveWeighSuccess extends WeightState {}

class DeleteWeightLoading extends WeightState {}

class DeleteWeightError extends WeightState {}

class DeleteWeighSuccess extends WeightState {}

class UpdateWeightLoading extends WeightState {}

class UpdateWeightError extends WeightState {}

class UpdateWeighSuccess extends WeightState {}

class StartChangeSliderValue extends WeightState {}

class EndChangeSliderValue extends WeightState {}
