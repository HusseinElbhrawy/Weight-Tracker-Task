import 'package:weight_tracker/core/error/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:weight_tracker/core/usecases/usecases.dart';
import 'package:weight_tracker/core/utils/app_strings.dart';
import 'package:weight_tracker/features/weight/domain/repositories/weight_repo.dart';

class UpdateWeightUseCase implements UseCases<void, Map> {
  final WeightRepository weightRepository;

  UpdateWeightUseCase({required this.weightRepository});
  @override
  Future<Either<Failure, void>> call(Map data) {
    return weightRepository.UpdateWeight(
        data[AppStrings.docsId], data[AppStrings.weight]);
  }
}
