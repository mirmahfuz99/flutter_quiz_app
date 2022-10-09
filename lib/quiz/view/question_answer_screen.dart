import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_quiz/core/enums/network_status.dart';
import 'package:programming_quiz/quiz/cubit/quiz_cubit.dart';
import 'package:programming_quiz/quiz/widgets/question_answer_populated.dart';

class QuestionAnswerScreen extends StatelessWidget {
  const QuestionAnswerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
        body: BlocBuilder<QuizCubit,QuizState>(
          builder: (context,state){
            print(state.questionModel);

            switch(state.networkStatus){
              case NetworkStatus.initial:
                return const Center(child: Text("initial"));
              case NetworkStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case NetworkStatus.success:
                return QuestionAnswerPopulated(questionModel: state.questionModel!,);
              default:
                return const Center(child: Text("initial"));
            }
          },
        )
    );
  }
}
