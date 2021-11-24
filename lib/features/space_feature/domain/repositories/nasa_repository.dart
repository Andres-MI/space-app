import 'package:dartz/dartz.dart';
import 'package:space_app/core/error/failures.dart';
import 'package:space_app/features/space_feature/domain/entities/mars_picture.dart';
import 'package:space_app/features/space_feature/domain/entities/picture_of_the_day.dart';

abstract class NasaRepository {
  Future<Either<Failure, PictureOfTheDay>> getPictureOfTheDay();
  Future<Either<Failure, MarsPicture>> getMarsPicture({required String cameraType});
}
