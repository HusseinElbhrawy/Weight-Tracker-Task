import 'package:weight_tracker/core/error/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:weight_tracker/core/usecases/usecases.dart';
import 'package:weight_tracker/features/weight/domain/repositories/weight_repo.dart';

class DeleteWeightUseCase implements UseCases<void, String> {
  final WeightRepository weightRepository;

  DeleteWeightUseCase({required this.weightRepository});
  @override
  Future<Either<Failure, void>> call(String docsId) {
    return weightRepository.DeletedWeight(docsId);
  }
}
