import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:space_app/core/error/failures.dart';
import 'package:space_app/core/usecases/usecase.dart';
import 'package:space_app/features/space_feature/domain/entities/mars_picture.dart';
import 'package:space_app/features/space_feature/domain/repositories/nasa_repository.dart';

class GetMarsPictureUseCase implements UseCase<MarsPicture, MarsPictureParams> {
  final NasaRepository repository;

  GetMarsPictureUseCase(this.repository);

  @override
  Future<Either<Failure, MarsPicture>> call(MarsPictureParams params) async {
    return await repository.getMarsPicture(cameraType: params.cameraType);
  }
}

class MarsPictureParams extends Equatable {
  final String cameraType;

  const MarsPictureParams({required this.cameraType});

  @override
  List<Object?> get props => [];
}
