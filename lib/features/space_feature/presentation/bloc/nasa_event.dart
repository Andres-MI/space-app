part of 'nasa_bloc.dart';

abstract class NasaEvent extends Equatable {
  const NasaEvent();
  @override
  List<Object?> get props => [];
}

class GetPictureOfTheDayEvent extends NasaEvent {}

class GetMarsPictureEvent extends NasaEvent {
  final String cameraType;

  const GetMarsPictureEvent({required this.cameraType});
  @override
  List<Object> get props => [cameraType];
}
