import 'package:dartz/dartz.dart';
import 'package:space_app/core/error/failures.dart';
import 'package:space_app/features/space_feature/data/data_sources/nasa_local_data_source.dart';
import 'package:space_app/features/space_feature/data/data_sources/nasa_remote_data_source.dart';
import 'package:space_app/features/space_feature/data/models/mars_picture_model.dart';
import 'package:space_app/features/space_feature/data/models/picture_of_the_day_model.dart';
import 'package:space_app/features/space_feature/domain/entities/mars_picture.dart';
import 'package:space_app/features/space_feature/domain/entities/picture_of_the_day.dart';
import 'package:space_app/features/space_feature/domain/repositories/nasa_repository.dart';

class NasaRepositoryImpl implements NasaRepository {
  final NasaRemoteDataSource remoteDataSource;
  final NasaLocalDataSource localDataSource;

  NasaRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, MarsPicture>> getMarsPicture(
      {required String cameraType}) async {
    try {
      final response = await remoteDataSource.getMarsPicture(cameraType);
      final marsPicture = convertToMarsPicture(response);
      return Right(marsPicture);
    } on Exception catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PictureOfTheDay>> getPictureOfTheDay() async {
    try {
      final response = await remoteDataSource.getPictureOfTheDay();
      final picOfTheDay = convertToPictureOfTheDay(response);
      return Right(picOfTheDay);
    } on Exception catch (e) {
      return Left(ServerFailure());
    }
  }

  MarsPicture convertToMarsPicture(MarsPictureModel response) {
    MarsPicture marsPicture = MarsPicture(
        urlImage: response.photos?[0].imgSrc ?? '',
        earthDate: response.photos?[0].earthDate ?? '');
    return marsPicture;
  }

  PictureOfTheDay convertToPictureOfTheDay(PictureOfTheDayModel response) {
    return PictureOfTheDay(title: response.title ?? '', url: response.url ?? '');
  }
}
