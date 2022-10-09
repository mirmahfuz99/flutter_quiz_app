

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:programming_quiz/main.dart';
import 'package:programming_quiz/quiz/models/question_model.dart';
import 'package:programming_quiz/quiz/repo/quiz_repository.dart';

void main() {
  test('Counter increments smoke test', () async {

    QuestionModel? questionData = await QuizRepository().questionData();
    print(questionData!.questions?.length);

    print(questionData.questions!.elementAt(0).answers!.toJson().entries.toList());


  });
}
