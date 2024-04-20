class QuestionResponse {
  final String question;
  final List<String> options;
  final String selectedOption;

  QuestionResponse(
      {required this.question,
      required this.options,
      required this.selectedOption});

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'options': options,
      'selectedUserOption': selectedOption,
    };
  }
}
