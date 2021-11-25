import 'package:flutter/material.dart';
import 'package:space_app/features/space_feature/domain/entities/picture_of_the_day.dart';
class PageA extends StatefulWidget {
  static const String screenId = 'page_a';

  const PageA({Key? key}) : super(key: key);

  @override
  State<PageA> createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PictureOfTheDay;

    return Container();
  }
}
