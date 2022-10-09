import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class HighScoreBestQuiz extends StatelessWidget {
  final int? highScore;
  const HighScoreBestQuiz({Key? key, required this.highScore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.white,
      strokeWidth: 2,
      borderType: BorderType.RRect,
      strokeCap: StrokeCap.square,
      dashPattern: const [6],
      child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4.0),
          child: Center(child: Text("Highscore \n ${highScore!} Point",style: const TextStyle(color: Colors.white,fontSize: 15.0),))
      ),
    );
  }
}
