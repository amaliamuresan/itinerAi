import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itiner_ai/models/attraction.dart';
import 'package:itiner_ai/models/destination.dart';
import 'package:itiner_ai/models/gtp_attraction.dart';
import 'package:itiner_ai/services/viator_service.dart';
import 'package:itiner_ai/style/text_style.dart';
import 'package:itiner_ai/ui/itinerary_item.dart';
import 'package:lottie/lottie.dart';

import '../colors/colors.dart';
import '../models/question_response.dart';
import '../services/open_ai_service.dart';

class ItineraryScreen extends StatefulWidget {
  const ItineraryScreen(
      {super.key, required this.destination, required this.responses});

  final Destination destination;
  final List<QuestionResponse> responses;

  @override
  State<ItineraryScreen> createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  late Future<dynamic> future;

  @override
  void initState() {
    super.initState();
    future = getItinerary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: getItinerary(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        ItineraryItem(attraction: snapshot.data![index]));
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset("assets/animations/loading.json",
                          width: 100, height: 100),
                      const SizedBox(height: 32),
                      Text(
                        "your itinerary is almost done!",
                        textAlign: TextAlign.center,
                        style: ThemeText.bodyLargeRegular
                            .copyWith(color: DesignColors.grey4),
                      )
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }

  Future<List<GptAttraction>?> getItinerary() async {
    try {
      final attractions = await ViatorService()
          .getAttractions(widget.destination.destinationId);
      print(attractions?.map((e) => e.toJson()));
      // final resp = await rootBundle.loadString('assets/viator_resp.json');
      // final data = await json.decode(resp);
      //
      // // Parse JSON string into a list of attractions
      //
      // // Extract required fields from each attraction in each list
      // // final destinations = await ViatorService().getDestinations();
      // final attractions = decodeAttractions(data);

      final inResponse = await OpenAiService().request('''
      Generate an itinerary for one day for a tourist in ${widget.destination.destinationName}. There are the only attractions he can visit:${attractions?.map((e) => e.toJson())}
      The user like this to the following questions:
      
      The itinerary should be a json format look like this:
      [
      {
        "hour":9.00AM,
        "attractionName" Checkpoint-Charlie,
        "duration": 2h,
        "webURL": webURL,
        "thumbnailHiResURL": thumbnailHiResURL,
        "descriptionText" : descriptionText
      },
      .
      .
      .
      ]
      ''');
      final decodedResp = await json.decode(inResponse!);
      print(decodeGptAttraction(decodedResp));
      final gptAttractions = decodeGptAttraction(decodedResp);
      List<GptAttraction> cleanedGptAttractions = List.from([]);
      for (GptAttraction i in gptAttractions) {
        Attraction? attraction = attractions
            ?.where((element) => element.title == i.title)
            .firstOrNull;
        if (attraction != null) {
          cleanedGptAttractions.add(i.copyWith(
              webURL: attraction.webURL,
              thumbnailHiResURL: attraction.thumbnailHiResURL));
        } else {
          cleanedGptAttractions.add(i);
        }
      }

      return cleanedGptAttractions;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
