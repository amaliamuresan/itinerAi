import 'package:flutter/cupertino.dart';
import 'package:itiner_ai/colors/colors.dart';
import 'package:itiner_ai/style/text_style.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: DesignColors.introBg4)),
      child: Text(
        text,
        style:
            ThemeText.bodyMediumRegular.copyWith(color: DesignColors.introBg4),
      ),
    );
  }
}
