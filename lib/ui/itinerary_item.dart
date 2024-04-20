import 'package:flutter/material.dart';
import 'package:itiner_ai/models/gtp_attraction.dart';

class ItineraryItem extends StatelessWidget {
  const ItineraryItem({super.key, required this.attraction});

  final GptAttraction attraction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [Text(attraction.hour), Divider(thickness: 1)],
        ),
        Image.network(
          attraction.thumbnailHiResURL,
          errorBuilder: (_, __, ___) => Container(),
          height: 200,
          fit: BoxFit.fill,
        ),
        Text(attraction.title),
        Text(attraction.duration)
      ],
    );
  }
}
