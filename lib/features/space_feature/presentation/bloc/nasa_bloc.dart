import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:space_app/core/enum/camera_type.dart';
import 'package:space_app/core/usecases/usecase.dart';
import 'package:space_app/features/space_feature/domain/entities/mars_picture.dart';
import 'package:space_app/features/space_feature/domain/entities/picture_of_the_day.dart';
import 'package:space_app/features/space_feature/domain/use_cases/get_mars_picture_use_case.dart';
import 'package:space_app/features/space_feature/domain/use_cases/get_picture_of_the_day_use_case.dart';

part 'nasa_event.dart';
part 'nasa_state.dart';

class NasaBloc extends Bloc<NasaEvent, NasaState> {
  final GetPictureOfTheDayUseCase pictureOfTheDayUseCase;
  final GetMarsPictureUseCase marsPictureUseCase;

  NasaBloc({required this.pictureOfTheDayUseCase, required this.marsPictureUseCase})
      : super(NasaInitial()){
    on<GetPictureOfTheDayEvent>((event, emit) async {
      emit(NasaLoading());
        final failureOrPicOfTheDay = await pictureOfTheDayUseCase(NoParams());
        failureOrPicOfTheDay.fold((failure) => emit(const NasaError(message: 'Error retrieving picture of the day')),
                (picOfTheDay) => emit(PicOfTheDayLoaded(pictureOfTheDay: picOfTheDay)));
    });

    on<GetMarsPictureEvent>((event, emit) async {
      emit(NasaLoading());
      final failureOrMarsPic = await marsPictureUseCase(MarsPictureParams(cameraType: event.cameraType.stringValue()));
          failureOrMarsPic.fold((failure) => emit(const NasaError(message: 'Error retrieving Mars picture')),
              (marsPicture) => emit(MarsPicLoaded(marsPicture: marsPicture)));
    });
  }

  ///Legacy Bloc < 7.2.0
  // @override
  // Stream<NasaState> mapEventToState(
  //   NasaEvent event,
  // ) async* {
  //   if (event is GetPictureOfTheDayEvent) {
  //     yield NasaLoading();
  //     final failureOrPicOfTheDay = await pictureOfTheDayUseCase(NoParams());
  //     yield failureOrPicOfTheDay.fold(
  //         (failure) => const NasaError(message: 'Error Retrieving Picture Of The Day'),
  //         (picOfTheDay) => PicOfTheDayLoaded(pictureOfTheDay: picOfTheDay));
  //   } else if (event is GetMarsPictureEvent) {
  //     yield NasaLoading();
  //     final cameraType = event.cameraType;
  //     final failureOrMarsPic =
  //         await marsPictureUseCase(MarsPictureParams(cameraType: cameraType.stringValue()));
  //     yield failureOrMarsPic.fold(
  //         (failure) => const NasaError(message: 'Error Retrieving Mars Picture'),
  //         (marsPicture) => MarsPicLoaded(marsPicture: marsPicture));
  //   }
  // }
}
