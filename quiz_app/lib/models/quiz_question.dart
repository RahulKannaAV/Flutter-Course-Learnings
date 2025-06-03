class QuizQuestion {
  const QuizQuestion(this.questionText, this.choices);

  final String questionText;
  final List<String> choices;

  List<String> getShuffledList() {
    final List<String> copiedChoices = List.of(choices);
    copiedChoices.shuffle();

    return copiedChoices;
  }
}
