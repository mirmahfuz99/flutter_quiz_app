import 'package:flutter/material.dart';

class BackToHome extends StatelessWidget {
  const BackToHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Navigator.pop(context),
        child: Container(
            height: 45.0,
            color: Colors.white,
            width: MediaQuery.of(context).size.width / 2.5,
            child: const Center(child: Text("Back to home"))));
  }
}
