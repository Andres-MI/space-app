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

  @override
  List<Object> get props => [pictureOfTheDay];
}

class MarsPicLoaded extends NasaState {
  final MarsPicture marsPicture;

  const MarsPicLoaded({required this.marsPicture});

  @override
  List<Object> get props => [marsPicture];
}

class NasaError extends NasaState {
  final String message;

  const NasaError({required this.message});
  @override
  List<Object> get props => [message];
}
