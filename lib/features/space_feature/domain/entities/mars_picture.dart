import 'package:equatable/equatable.dart';

class MarsPicture extends Equatable {
  final String urlImage;
  final String earthDate;

  const MarsPicture({required this.urlImage, required this.earthDate});

  @override
  List<Object?> get props => [urlImage, earthDate];
}
