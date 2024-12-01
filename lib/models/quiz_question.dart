class QuizQuestion {
  const QuizQuestion(this.question, this.options);

  final String question;
  final List<String> options;

  List<String> getShuffleAnswers() {
    final shuffleAnswer = List.of(options);
    shuffleAnswer.shuffle();
    return shuffleAnswer;
  }
}
