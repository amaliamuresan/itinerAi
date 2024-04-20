import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:itiner_ai/colors/colors.dart';
import 'package:itiner_ai/models/question_response.dart';
import 'package:itiner_ai/style/text_style.dart';
import 'package:itiner_ai/ui/destination_chip.dart';

import '../models/question.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem(
      {super.key,
      required this.question,
      this.questionResponse,
      required this.onResponseTap});
  final Question question;
  final QuestionResponse? questionResponse;
  final Function(QuestionResponse response) onResponseTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
            TypewriterAnimatedText(
              question.question,
              textStyle: ThemeText.h4Regular
                  .copyWith(color: DesignColors.grey7, height: 1.2),
            ),
          ]),
        ),
        SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Wrap(
            runSpacing: 8,
            spacing: 8,
            children: question.options
                .map((e) => GestureDetector(
                    onTap: () {
                      onResponseTap(QuestionResponse(
                          question: question.question,
                          options: question.options,
                          selectedOption: e));
                    },
                    child: DestinationChip(
                        isSelected: questionResponse?.selectedOption == e,
                        text: e)))
                .toList(),
          ),
        )
      ],
    );
  }
}
