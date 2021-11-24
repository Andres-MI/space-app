import 'package:equatable/equatable.dart';

class PictureOfTheDay extends Equatable {
  final String title;
  final String url;
  String? copyright;

  PictureOfTheDay({required this.title, required this.url, this.copyright});

  @override
  List<Object?> get props => [title, url];
}
