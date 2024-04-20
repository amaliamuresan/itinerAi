import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:itiner_ai/colors/colors.dart';
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
              Image.asset(
                'assets/logos/Star_icon.png',
                width: 30,
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border:
                          Border.all(width: 2, color: DesignColors.orangeDark)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Text(
                      attraction.hour,
                      style: ThemeText.bodyLargeRegular
                          .apply(color: DesignColors.orangeDark),
                    ),
                  ),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border:
                    Border.all(width: 2, color: DesignColors.orangeDark)),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                  child: Text(
                    attraction.duration,
                    style: ThemeText.bodyLargeRegular
                        .apply(color: DesignColors.orangeDark),
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(attraction.descriptionText,style: ThemeText.bodyLargeRegular.copyWith(color: DesignColors.grey7),)),
          Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                attraction.thumbnailHiResURL,
                errorBuilder: (_, __, ___) => Image.asset(
                  'assets/logos/star_placeholder.png',
                  width: 200,
                  height: 200,
                ),
                height: 200,
                width: 200,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      attraction.title,
                      style: ThemeText.h4Bold.apply(color: DesignColors.grey7),
                    ),
                  ),
                  const SizedBox(width: 14,),
                  TextButton(
                    style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                      onPressed: () {},
                      child: Text(
                        'Learn More',
                        style: ThemeText.bodyLargeRegular
                            .copyWith(color: DesignColors.grey4),
                      ),),
                ],
              ),
            )
          ]),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
