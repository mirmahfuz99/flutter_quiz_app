import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_quiz/quiz/cubit/quiz_cubit.dart';
import 'package:programming_quiz/quiz/models/question_model.dart';
import 'package:programming_quiz/quiz/widgets/back_to_home.dart';
import 'package:programming_quiz/quiz/widgets/list_of_answers.dart';
import 'package:programming_quiz/quiz/widgets/question_area.dart';
import 'ques_ans_header.dart';

class QuestionAnswerPopulated extends StatelessWidget {
  final QuestionModel questionModel;
  const QuestionAnswerPopulated({Key? key,required this.questionModel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit,QuizState>(
      builder: (context,state){
        int currentIndex = state.currentIndex!;
        List<Questions> questions = state.questionModel!.questions!;
        return SingleChildScrollView(
          child: Column(children:  [
            const SizedBox(height: 80.0,),
            QuesAnsHeader(
              currentIndex: currentIndex + 1,
              highScore: state.highScore,
              totalQuestion: questions.length,
            ),
            const SizedBox(height: 20.0,),
            QuestionArea(questions: questions.elementAt(currentIndex),),
            const SizedBox(height: 20.0,),
            ListOfAnswers(
              questions: questions,
              currentIndex: state.currentIndex!,
              highScore: state.highScore!,
              selectedAnsKey: state.selectedAnsKey,
              answer:  state.questionModel!.questions!.elementAt(currentIndex).answers!.toJson().entries.where((element) => element.value != null).toList(),
            ),
            if(currentIndex == questions.length -1)
            const BackToHome()
          ],),
        );
      },
    );
  }
}
