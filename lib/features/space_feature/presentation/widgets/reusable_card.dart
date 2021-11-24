import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  const ReusableCard({required this.colour, required this.cardChild, required this.onClick, Key? key}): super(key: key);

  final Color colour;
  final Widget cardChild;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}