import 'package:flutter/material.dart';
import 'package:itiner_ai/models/gtp_attraction.dart';
import 'package:itiner_ai/style/text_style.dart';

class ItineraryItem extends StatelessWidget {
  const ItineraryItem({super.key, required this.attraction});

  final GptAttraction attraction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                attraction.hour,
                style: ThemeText.h3.apply(color: Colors.black87),
              ),
              const SizedBox(width: 8),
              Text(
                attraction.duration,
                style: ThemeText.bodyMediumRegular.apply(color: Colors.black54),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.black26,
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              attraction.thumbnailHiResURL,
              errorBuilder: (_, __, ___) => Container(),
              height: 200,
              width: 300,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            attraction.title,
            style: ThemeText.bodyLargeBold.apply(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
