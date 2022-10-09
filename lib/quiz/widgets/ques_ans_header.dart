import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class QuesAnsHeader extends StatelessWidget {
  final int? currentIndex;
  final int? highScore;
  final int? totalQuestion;

  const QuesAnsHeader({Key? key, this.currentIndex, this.highScore, this.totalQuestion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 2),
        child: DottedBorder(
          color: Colors.black,
          strokeWidth: 2,
          borderType: BorderType.RRect,
          strokeCap: StrokeCap.square,
          dashPattern: const [6],
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text("Question: $currentIndex/$totalQuestion"),
                  Text("Score: $highScore"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


