import 'dart:convert';

import 'package:http/http.dart' as http;

class OpenAiService {
  static final Uri chatUri =
      Uri.parse('https://api.openai.com/v1/chat/completions');

  static final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ',
  };

  Map<String, dynamic> getBody(String prompt) => {
        'model': 'gpt-3.5-turbo', // GPT-3.5 turbo model
        'messages': [
          {"role": "system", "content": prompt}
        ],
        'max_tokens': 2000, // Maximum number of tokens to generate
        'temperature': 0.7, // Controls the randomness of the generated text
        // 'top_p': 1, // Controls the diversity of the generated text
        // 'n': 1, // Number of completions to generate
      };

  Future<String?> request(String prompt) async {
    try {
      var response = await http.post(
        chatUri,
        headers: headers,
        body: jsonEncode(getBody(prompt)),
      );
      return response.body;
    } catch (e) {
      print("error $e");
    }
    return null;
  }
}
