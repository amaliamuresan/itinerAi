import 'package:flutter/material.dart';
import 'package:itiner_ai/colors/colors.dart';
import 'package:itiner_ai/style/text_style.dart';
import 'package:itiner_ai/ui/set_location_page.dart';
import 'package:lottie/lottie.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({super.key});

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  @override
  void initState() {
    super.initState();
  }

  int pageNo = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          /*pageNo == 1 ?*/ DesignColors.grey7 /*: DesignColors.orangeDark*/,
      body: GestureDetector(
        onTap: () {
          setState(() {
            pageNo = 2;
          });
        },
        child: Stack(children: [
          Positioned(
            bottom: 0,
            child: Lottie.asset('assets/animations/gradient.json'),
          ),
          Center(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
                child: pageNo == 1
                    ? _displayPageOneContent()
                    : _displayPageTwoContent()),
          ),
        ]),
      ),
    );
  }

  Widget _displayPageOneContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Text(
            'Discover',
            style: ThemeText.h1.copyWith(
                color: DesignColors.grey0, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Image.asset(
              'assets/logos/itinerAI-white.png',
              height: 40,
            ),
          ),
        ],
      ),

      Text(
        'Built for citybreaks... used for whatever you want.',
        style: ThemeText.h1
            .copyWith(color: DesignColors.grey0, fontWeight: FontWeight.w300),
        textAlign: TextAlign.start,
      ),

      // Text(
      //   'used for whatever you want.',
      //   style: ThemeText.h1
      //       .copyWith(color: DesignColors.grey0, fontWeight: FontWeight.w300),
      //   textAlign: TextAlign.center,
      // ),
      Spacer(),
      Spacer(),
      Center(
        child: Text(
          'Tap to learn more',
          style: ThemeText.h4Regular.copyWith(
            color: DesignColors.grey0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ]);
  }

  Widget _displayPageTwoContent() {
    return Column(children: [
      Spacer(),
      Text(
        'How does this thing work?',
        style: ThemeText.h1.copyWith(color: DesignColors.grey0),
        textAlign: TextAlign.start,
      ),
      Text(
        'Answer a set of questions and you will get a personalized itinerary.',
        style: ThemeText.h1
            .copyWith(color: DesignColors.grey1, fontWeight: FontWeight.w300),
        textAlign: TextAlign.start,
      ),
      Spacer(),
      Spacer(),
      GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SetLocationPage())),
        child: Text('Get started',
            style: ThemeText.h4Regular.copyWith(
              color: DesignColors.grey0,
            )),
      )
    ]);
  }
}
