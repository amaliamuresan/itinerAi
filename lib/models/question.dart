import 'dart:convert';

class Question {
  final String question;
  final List<String> options;

  Question({
    required this.options,
    required this.question,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['prompt'] ?? '',
      options: List<String>.from(json['options'] ?? []),
    );
  }
}

List<Question> decodeQuestions(Map<String, dynamic> jsonResponse) {
  final data = jsonResponse['choices'][0]["message"]["content"];
  print(data);
  final json = parseStringToJson(data);
  List<Question> questions = [];
  print(json);
  print("json");
  for (var destination in json) {
    print("destination jsn");
    questions.add(Question.fromJson(destination));
  }
  return questions;
}

List<Map<String, dynamic>> parseStringToJson(String jsonString) {
  // Remove leading and trailing whitespace and newlines
  jsonString = jsonString.trim();

  // Check if the string starts with '[' and ends with ']', indicating it's a list
  if (jsonString.startsWith('[') && jsonString.endsWith(']')) {
    // Parse the string into a List<dynamic>
    List<dynamic> jsonList = json.decode(jsonString);

    // Convert each dynamic element into a Map<String, dynamic>
    List<Map<String, dynamic>> result = [];
    for (var item in jsonList) {
      if (item is Map<String, dynamic>) {
        result.add(item);
      }
    }

    return result;
  } else {
    // Not a valid JSON list, return an empty list
    return [];
  }
}
