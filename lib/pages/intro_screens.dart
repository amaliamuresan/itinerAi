import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:itiner_ai/colors/colors.dart';
import 'package:itiner_ai/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({super.key});

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  // defining the Offset of the animation
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    final curvedAnimation =
    CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.03),
    ).animate(curvedAnimation)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }
  int pageNo=1;
  @override
  Widget build(BuildContext context) {
    final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

    return Scaffold(
      backgroundColor: pageNo==1?DesignColors.grey7:DesignColors.orangeDark,
      body: GestureDetector(
        onTap: (){
          setState(() {pageNo=2;});print('ciao');
        },
        child: Stack(children: [
          Center(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
                child: SlideTransition(
                          position: _offsetAnimation,
                          child: pageNo==1?_displayPageOneContent():_displayPageTwoContent()
                    )
          ),
          ),
          Positioned(
              bottom: 0, child: Lottie.asset('assets/animations/gradient.json')),
        ]),
      ),
    );
  }
  Widget _displayPageOneContent(){
    return Column(
        children: [
          Text(
            'Discover',
            style: ThemeText.h1
                .copyWith(color: DesignColors.grey0,fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 50.0),
            child: Image.asset(
              'assets/logos/itinerAI-white.png',
            ),
          ),
          Text(
            'built for citybreaks...',
            style: ThemeText.h1
                .copyWith(color: DesignColors.grey0, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          Text(
            'used for whatever you want.',
            style: ThemeText.h1
                .copyWith(color: DesignColors.grey0, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 100,
          ),
          Text(
            'tap to learn more',
            style: ThemeText.h4Regular
                .copyWith(color: DesignColors.grey0,),
            textAlign: TextAlign.center,
          ),
        ]
    );
  }

  Widget _displayPageTwoContent(){
    return Column(
        children: [
          Text(
            'What is itinerAI anyways?',
            style: ThemeText.h1
                .copyWith(color: DesignColors.grey0),
            textAlign: TextAlign.center,
          ),
          Text(
            'Answer a set of questions. Tell us what are your expectations.',
            style: ThemeText.h1
                .copyWith(color: DesignColors.grey0),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(onPressed: ()=>print('au')//TODO add navigation to where are you going
    , child: const Text('Get Started'))
        ]
    );
  }
}
