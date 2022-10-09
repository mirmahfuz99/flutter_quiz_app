part of 'quiz_cubit.dart';

class QuizState {
  final NetworkStatus? networkStatus;
  final QuestionModel? questionModel;

  final String? selectedAnsKey;
  final int? currentIndex;
  final int? highScore;
  final bool? isAnswered;

  QuizState({
    this.networkStatus = NetworkStatus.initial,
    this.questionModel,
    this.selectedAnsKey,
    this.currentIndex = 0,
    this.highScore = 0,
    this.isAnswered = false,
  });

  QuizState copyWith({
    NetworkStatus? networkStatus,
    QuestionModel? questionModel,
    String? selectedAnsKey,
    int? currentIndex,
    int? highScore,
    bool? isAnswered,
  }){
    return QuizState(
        networkStatus: networkStatus ?? this.networkStatus,
        questionModel: questionModel,
      selectedAnsKey: selectedAnsKey,
        currentIndex: currentIndex ?? this.currentIndex,
        highScore: highScore ?? this.highScore,
      isAnswered: isAnswered ?? this.isAnswered,
    );
  }

  @override
  List<Object?> get props => [networkStatus, questionModel, selectedAnsKey, currentIndex, highScore, isAnswered];
}