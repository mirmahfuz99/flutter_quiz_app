import 'package:flutter/material.dart';
import 'package:programming_quiz/core/exceptions.dart';
import 'package:programming_quiz/quiz/main_menu_screen.dart';
import 'package:programming_quiz/quiz/view/question_answer_screen.dart';


class AppRouter {
  static const String initialRoute = '/';
  static const String questionAnswerMenu = '/questionAnswerMenu';

  const AppRouter._();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name){
      case initialRoute:
        return MaterialPageRoute(builder: (_) => const MainMenuScreen());
      case questionAnswerMenu:
        return MaterialPageRoute(builder: (_) => const QuestionAnswerScreen());
      default:
        throw const RouteException('Route not found!');
    }
  }

}