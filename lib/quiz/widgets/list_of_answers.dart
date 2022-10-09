import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_quiz/components/ripple_button.dart';
import 'package:programming_quiz/core/helper/helpers.dart';
import 'package:programming_quiz/quiz/cubit/quiz_cubit.dart';
import 'package:programming_quiz/quiz/models/question_model.dart';

class ListOfAnswers extends StatelessWidget {
  final List<Questions>? questions;
  final int? currentIndex;
  final int? highScore;
  final String? selectedAnsKey;
  List<MapEntry<String, dynamic>> answer;


  ListOfAnswers({
    Key? key,
    required this.questions,
    required this.currentIndex,
    required this.highScore,
    required this.selectedAnsKey,
    required this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit,QuizState>(
      builder: (context,state){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0))
            ),
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 6),
              child:DottedBorder(
                  color: Colors.black,
                  strokeWidth: 2,
                  borderType: BorderType.RRect,
                  strokeCap: StrokeCap.square,
                  dashPattern: const [6],
                  child: ListView.builder(
                      itemCount: answer.length,
                      padding: const EdgeInsets.all(0.0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        bool isCorrectAns = false;
                        bool isWrongAns = false;
                        if(!state.isAnswered!){
                           isCorrectAns = (questions!.elementAt(currentIndex!).correctAnswer == selectedAnsKey && selectedAnsKey == answer.elementAt(index).key);
                           isWrongAns = (questions!.elementAt(currentIndex!).correctAnswer != selectedAnsKey && selectedAnsKey == answer.elementAt(index).key);
                        }



                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Container(
                                decoration:  BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color:
                                      isCorrectAns ?
                                      Colors.green:
                                       isWrongAns?
                                      Colors.red:Colors.white,width: 3),
                                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(child: Text(answer.elementAt(index).value)),
                                ),
                              ),
                              Positioned.fill(child: RippleButton(onTap: () async{
                                if(isRedundentClick(DateTime.now())){
                                  return;
                                }
                                int score;
                                if(questions!.elementAt(currentIndex!).correctAnswer == answer.elementAt(index).key){
                                  score = highScore! + questions!.elementAt(currentIndex!).score!;
                                }else{
                                  score = highScore!;
                                }
                                context.read<QuizCubit>().implementQuiz(
                                    selectedAnsKey: answer.elementAt(index).key,
                                    highScore: score,
                                    currentIndex: currentIndex!,
                                    isAnswered: false);
                                await Future.delayed(const Duration(seconds: 4));
                                context.read<QuizCubit>().implementQuiz(
                                    selectedAnsKey: answer.elementAt(index).key,
                                    highScore: score,
                                    currentIndex: currentIndex! < questions!.length - 1 ?  currentIndex! + 1 : currentIndex!,
                                    isAnswered: true);
                              }))
                            ],
                          ),
                        );
                      }),
              )
            ),
          ),
        );
      },
    );
  }
}
