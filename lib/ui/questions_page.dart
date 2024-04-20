import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itiner_ai/colors/colors.dart';
import 'package:itiner_ai/models/destination.dart';
import 'package:itiner_ai/ui/itinerary_screen.dart';
import 'package:itiner_ai/ui/question_item.dart';
import 'package:lottie/lottie.dart';

import '../models/question.dart';
import '../models/question_response.dart';
import '../services/open_ai_service.dart';
import '../style/text_style.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key, required this.destination});

  final Destination destination;

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  late Future<List<Question>?> future;

  @override
  void initState() {
    super.initState();
    future = getQuestions(widget.destination.destinationName);
  }

  List<QuestionResponse> questionResponses = List.from([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignColors.grey1,
      body: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ListView.builder(
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) => Visibility(
                          visible: index <= questionResponses.length,
                          child: QuestionItem(
                            question: snapshot.data![index],
                            questionResponse:
                                questionResponses.elementAtOrNull(index),
                            onResponseTap: (QuestionResponse response) {
                              setState(() => questionResponses.add(response));
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: DesignColors.introBg3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            //borderRadius: BorderRadius.zero, //Rectangular border
                          ),
                        ),
                        onPressed: questionResponses.length >=
                                (snapshot.data?.length ?? 0)
                            ? () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ItineraryScreen(
                                        destination: widget.destination,
                                        responses: questionResponses
                                            .take(snapshot.data?.length ?? 0)
                                            .toList())));
                              }
                            : null,
                        child: Text(
                          "Create my itinerary!",
                          style: ThemeText.h4Regular
                              .apply(color: DesignColors.grey0),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset("assets/animations/loading.json",
                        width: 100, height: 100),
                    const SizedBox(height: 32),
                    Text(
                      "your destination is set...\nI am preparing the questions",
                      textAlign: TextAlign.center,
                      style: ThemeText.bodyLargeRegular
                          .copyWith(color: DesignColors.grey4),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }

  Future<List<Question>> getQuestions(String location) async {
    final response = await OpenAiService().request("""
      You are helping me plan a trip to $location. You have ask me a set of 4-5 questions that should give you an idea about my expectations about the trip, and the result is an itinerary for a full day. Do not mention landmarks in the questions you're asking. The questions should be fun with a bit of self deprecation, pointing the fact that you are an AI and travelling and visiting is not a thing you usually do. You could include prompts like: "Berlin sounds nice, I guess, never been there. You know, as an AI, you I am happy for you" or "I envy you, I've seen the parties in Berlin are something else. I get to see that on the internet... I am an AI, you know.". You could mention things AI related every few questions.
Generate it in the following json structure:
[
{
"prompt":"...",
"options":["...","...",...]
},
.
.
.
]
      """);
    final decodedResp = await json.decode(response!);
    final questions = decodeQuestions(decodedResp);
    return questions;
  }
}
