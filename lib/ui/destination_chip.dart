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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isSelected ? DesignColors.orangeDark : DesignColors.grey0,
      ),
      child: Text(
        text,
        style: ThemeText.bodyMediumRegular
            .apply(color: isSelected ? DesignColors.grey0 : DesignColors.grey7),
      ),
    );
  }
}
