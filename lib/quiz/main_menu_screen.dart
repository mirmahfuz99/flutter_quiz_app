import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programming_quiz/core/enums/network_status.dart';
import 'package:programming_quiz/quiz/cubit/quiz_cubit.dart';
import 'widgets/app_title.dart';
import 'widgets/high_score_best_quiz.dart';
import 'widgets/start_game_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<QuizCubit,QuizState>(
        builder: (context,state){
          switch(state.networkStatus){
            case NetworkStatus.initial:
              return const Center(child: Text("initial"));
            case NetworkStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case NetworkStatus.success:
              return Container(
                color: Colors.indigo,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const AppTitle(),
                        const SizedBox(height: 30.0,),
                        HighScoreBestQuiz(highScore: state.highScore!,),
                        const SizedBox(height: 30.0,),
                        const StartGameButton(),
                        const SizedBox(height: 20.0,),
                      ],
                    ),
                  ),
                ),
              );
            default:
              return const Center(child: Text("initial"));
          }


        },
      ),
    );
  }


}
