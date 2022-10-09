import 'package:bloc/bloc.dart';
import 'package:programming_quiz/core/enums/network_status.dart';
import 'package:programming_quiz/quiz/models/question_model.dart';
import 'package:programming_quiz/quiz/repo/quiz_repository.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuestionModel? questionModel;
  QuizCubit() : super( QuizState());

  getQuestionData() async{
    emit( QuizState().copyWith(networkStatus: NetworkStatus.loading,));
    questionModel = await QuizRepository().questionData();
    if(questionModel != null){
      emit( QuizState().copyWith(networkStatus: NetworkStatus.success,questionModel: questionModel,currentIndex: 0,highScore: 0,));
    }else{
      emit( QuizState().copyWith(networkStatus: NetworkStatus.failure));
    }
  }

  implementQuiz({
    required String selectedAnsKey,
    required int highScore,
    required int currentIndex,
    required bool isAnswered,
  }) async{
    emit( QuizState().copyWith(
      selectedAnsKey: selectedAnsKey,
      networkStatus: NetworkStatus.success,
      questionModel: questionModel,
      currentIndex: currentIndex,
      highScore: highScore,
      isAnswered: isAnswered,
    ));
  }



}