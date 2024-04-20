import 'dart:convert';

class GptAttraction {
  final String title;
  final String webURL;
  final String thumbnailHiResURL;
  final String hour;
  final String duration;
  final String descriptionText;

  GptAttraction(
    this.hour,
    this.duration, {
    required this.title,
    required this.webURL,
    required this.thumbnailHiResURL,
    required this.descriptionText,
  });

  GptAttraction copyWith(
      {String? title,
      String? webURL,
      String? thumbnailHiResURL,
      String? hour,
      String? duration,
      String? descriptionText}) {
    return GptAttraction(
      hour ?? this.hour,
      duration ?? this.duration,
      title: title ?? this.title,
      webURL: webURL ?? this.webURL,
      thumbnailHiResURL: thumbnailHiResURL ?? this.thumbnailHiResURL,
      descriptionText: descriptionText ?? this.descriptionText,
    );
  }

  factory GptAttraction.fromJson(Map<String, dynamic> json) {
    return GptAttraction(
      json['hour'] as String? ?? '',
      json['duration'] as String? ?? "",
      title: json['attractionName'] as String? ?? "",
      webURL: json['webURL'] as String,
      thumbnailHiResURL: json['thumbnailHiResURL'] as String? ?? '',
      descriptionText: json['descriptionText'] as String? ?? '',
    );
  }
}

List<GptAttraction> decodeGptAttraction(Map<String, dynamic> jsonResponse) {
  final data = jsonResponse['choices'][0]["message"]["content"];
  print(data);
  final json = parseStringToJson(data);
  List<GptAttraction> questions = [];
  print(json);
  for (var destination in json) {
    questions.add(GptAttraction.fromJson(destination));
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
