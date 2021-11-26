import 'package:flutter/material.dart';

class PageB extends StatelessWidget {
  static const String screenId = 'page_b';

  const PageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: IconButton(onPressed: Navigator.of(context).canPop() ? () => Navigator.of(context).pop() : null,
            icon: const Icon(Icons.arrow_back_sharp)),),
      ),
    );
  }
}
