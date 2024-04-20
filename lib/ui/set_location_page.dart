import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:itiner_ai/colors/colors.dart';
import 'package:itiner_ai/ui/questions_page.dart';

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
      backgroundColor: DesignColors.introBg2,
      body: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final tenstrings = snapshot.data?.take(10);
              print(tenstrings?.map((e) => e.destinationName));
              return Padding(
                padding: const EdgeInsets.all(42),
                child: Column(
                  children: [
                    const Spacer(),
                    const Spacer(),
                    Text(
                      "Where are you going?",
                      style: ThemeText.h1,
                    ),
                    const Spacer(),
                    TextFormField(
                      controller: controller,
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "type your destination",
                        hintStyle: TextStyle(color: Colors.white54),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
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
                          backgroundColor: DesignColors.grey0,
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
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: DesignColors.grey1,
                              content: Text(
                                "Your destination is set!",
                                style: ThemeText.bodyMediumRegular
                                    .apply(color: DesignColors.mainColor),
                              ),
                            ));
                            Navigator.of(context)!.pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => QuestionsPage(
                                        destination: destination!)));
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
                              .apply(color: DesignColors.mainRedDark),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
