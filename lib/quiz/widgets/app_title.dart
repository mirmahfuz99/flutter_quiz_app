import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:programming_quiz/utils/images.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.white,
      strokeWidth: 2,
      borderType: BorderType.RRect,
      strokeCap: StrokeCap.square,
      dashPattern: const [6],
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Image.asset(Images.logo,height: 150,),
              const Text("Quiz",style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
