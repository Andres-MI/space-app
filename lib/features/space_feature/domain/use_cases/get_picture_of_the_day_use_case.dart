import 'package:dartz/dartz.dart';
import 'package:space_app/core/error/failures.dart';
import 'package:space_app/core/usecases/usecase.dart';
import 'package:space_app/features/space_feature/domain/entities/picture_of_the_day.dart';
import 'package:space_app/features/space_feature/domain/repositories/nasa_repository.dart';

class GetPictureOfTheDayUseCase implements UseCase<PictureOfTheDay, NoParams> {

  final NasaRepository repository;

  GetPictureOfTheDayUseCase(this.repository);

  @override
  Future<Either<Failure, PictureOfTheDay>> call(NoParams params) async {
    return await repository.getPictureOfTheDay();
  }

}
