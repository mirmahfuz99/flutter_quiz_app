import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:programming_quiz/quiz/models/question_model.dart';

class QuestionArea extends StatelessWidget {
  final Questions? questions;
   const QuestionArea({Key? key, required this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(4.0))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 6),
          child: DottedBorder(
            color: Colors.black,
            strokeWidth: 2,
            borderType: BorderType.RRect,
            strokeCap: StrokeCap.square,
            dashPattern: const [6],
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text("${questions!.score!} Point"),
                    if(questions!.questionImageUrl != null && questions!.questionImageUrl != 'null')
                    Image.network(questions!.questionImageUrl!,height: MediaQuery.of(context).size.height / 3,),
                    const SizedBox(height: 30.0,),
                    Text(questions!.question!),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}