import 'dart:convert';

import 'package:programming_quiz/quiz/models/question_model.dart';
import 'package:programming_quiz/utils/api_access.dart';
import 'package:http/http.dart' as http;


class QuizRepository {
  Future<QuestionModel?> questionData()async{
    var uri = Uri.parse(ApiAccess.questionAddress);
    try {
      final response = await http.get(uri);
      final result = jsonDecode(response.body);
      if(response.statusCode == 200){
        QuestionModel questionModel = QuestionModel.fromJson(result);
        return questionModel;
      }
    }catch(_){

    }
    return null;
  }
}