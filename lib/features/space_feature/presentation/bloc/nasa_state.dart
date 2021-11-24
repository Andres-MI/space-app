part of 'nasa_bloc.dart';

abstract class NasaState extends Equatable {
  const NasaState();
  @override
  List<Object> get props => [];
}

class NasaInitial extends NasaState {}

class NasaLoading extends NasaState {}

class PicOfTheDayLoaded extends NasaState {
  final PictureOfTheDay pictureOfTheDay;

  const PicOfTheDayLoaded({required this.pictureOfTheDay});
}

class MarsPicLoaded extends NasaState {
  final MarsPicture marsPicture;

  const MarsPicLoaded({required this.marsPicture});
}

class NasaError extends NasaState {
  final String message;

  const NasaError({required this.message});
}
