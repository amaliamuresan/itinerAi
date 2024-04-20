import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:itiner_ai/colors/colors.dart';
import 'package:itiner_ai/ui/questions_page.dart';
import 'package:lottie/lottie.dart';

import '../models/destination.dart';
import '../services/viator_service.dart';
import '../style/text_style.dart';

class SetLocationPage extends StatefulWidget {
  const SetLocationPage({Key? key}) : super(key: key);

  @override
  _SetLocationPageState createState() => _SetLocationPageState();
}

class _SetLocationPageState extends State<SetLocationPage> {
  final controller = TextEditingController();
  late Future<List<Destination>?> future;

  @override
  void initState() {
    super.initState();
    future = ViatorService().getDestinations();
  }

  Destination? selectedDestination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignColors.grey1,
      body: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final tenstrings = snapshot.data?.take(10);
              print(tenstrings?.map((e) => e.destinationName));
              return Padding(
                padding: const EdgeInsets.all(42),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const Spacer(),
                    Image.asset(
                      "assets/logos/itinerAI-orange.png",
                      height: 32,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Where are you going?",
                      style:
                          ThemeText.h1.copyWith(color: DesignColors.introBg3),
                    ),
                    const Spacer(),
                    TextFormField(
                      controller: controller,
                      style:
                          ThemeText.h3.copyWith(color: DesignColors.orangeDark),
                      decoration: const InputDecoration(
                        hintText: "type your destination",
                        hintStyle: TextStyle(color: DesignColors.grey4),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: DesignColors.mainRedDark),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: DesignColors.mainRedDark),
                        ),
                      ),
                    ),
                    Spacer(),
                    Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: DesignColors.orangeDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            //borderRadius: BorderRadius.zero, //Rectangular border
                          ),
                        ),
                        onPressed: () {
                          try {
                            final destination = snapshot.data?.firstWhere(
                                (e) => e.destinationName == controller.text);
                            if (kDebugMode) {
                              print(destination?.toJson());
                            }

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    QuestionsPage(destination: destination!)));
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: DesignColors.grey1,
                              content: Text(
                                "We cannot find your destination",
                                style: ThemeText.bodyMediumRegular
                                    .apply(color: DesignColors.mainColor),
                              ),
                            ));
                          }
                        },
                        child: Text(
                          "Continue",
                          style: ThemeText.h4Regular
                              .apply(color: DesignColors.grey0),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: Lottie.asset("assets/animations/loading.json",
                    width: 100, height: 100),
              );
            }
          }),
    );
  }
}
