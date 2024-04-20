import 'package:flutter/material.dart';
import 'package:itiner_ai/colors/colors.dart';
import 'package:itiner_ai/style/text_style.dart';

class DestinationChip extends StatelessWidget {
  const DestinationChip(
      {Key? key, required this.isSelected, required this.text})
      : super(key: key);
  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? DesignColors.introBg3 : Colors.white,
      ),
      child: Text(
        text,
        style: ThemeText.bodyMediumRegular
            .apply(color: isSelected ? Colors.white : Colors.black87),
      ),
    );
  }
}
