import 'package:flutter/material.dart';
import 'package:space_app/core/constants/constants.dart';
import 'package:space_app/features/space_feature/presentation/widgets/reusable_card.dart';

class HomePageHalf extends StatefulWidget {
  const HomePageHalf({Key? key}) : super(key: key);

  @override
  _HomePageHalfState createState() => _HomePageHalfState();
}

class _HomePageHalfState extends State<HomePageHalf> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Row(children: [
      Expanded(child: ReusableCard(colour: kBasicColor, cardChild: Text('Get Picture of The Day', style: TextStyle(color: Colors.white),), onClick: (){})),
      Expanded(child: ReusableCard(colour: kBasicColor, cardChild: Text('Get Mars Picture'), onClick: (){}))
    ],));
  }
}
