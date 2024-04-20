import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itiner_ai/reformat_api_response.dart';
import 'package:itiner_ai/services/open_ai_service.dart';
import 'package:itiner_ai/ui/set_location_page.dart';

import 'colors/colors.dart';
import 'models/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'DMSans',
        unselectedWidgetColor: Colors.black.withOpacity(0.7),
        colorSchemeSeed: DesignColors.mainColor,
      ),
      home: SetLocationPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Future<void> _incrementCounter() async {
    final resp = await rootBundle.loadString('assets/viator_resp.json');
    final data = await json.decode(resp);

    // Parse JSON string into a list of attractions

    // Extract required fields from each attraction in each list
    // final destinations = await ViatorService().getDestinations();
    final attractions = decodeAttractions(data);
    // // print(attractions.map((e) => e.toJson()));
    // print(destinations);
    // final response = await OpenAiService().request("""
    //     // You are creating an itinerary for one day in Berlin, there are the attractions available: ${attractions.map((e) => e.toJson())}
    //     // Based on these attractions, create the itinerary which will have the following structure:
    //     // [
    //     // {"time":string,
    //     // "attraction_title: string,
    //     // durationL: int},
    //     // .
    //     // .
    //     // .
    //     // ]
    //     // """);
    try {
      final response = await OpenAiService().request("""
      You are helping me plan a trip to Berlin. You have ask me a set of 4-5 questions that should give you an idea about my expectations about the trip, and the result is an itinerary for a full day. Do not mention landmarks in the questions you're asking. The questions should be fun with a bit of self deprecation, pointing the fact that you are an AI and travelling and visiting is not a thing you usually do. You could include prompts like: "Berlin sounds nice, I guess, never been there. You know, as an AI, you I am happy for you" or "I envy you, I've seen the parties in Berlin are something else. I get to see that on the internet... I am an AI, you know.". You could mention things AI related every few questions.
Generate it in the following json structure:
{
[
"prompt":"...",
"options":["...","...",...]
],
...
}
      """);
      final decodedResp = await json.decode(response!);
      final questions = decodeQuestions(decodedResp);
      print("questions $questions");
      //   final inResponse = await OpenAiService().request('''
      //   Generate an itinerary for one day for a tourist in Berlin. There are the attractions he can visit:${attractions.map((e) => e.toJson())}
      //   The user like this to the following questions:
      //   1. Are you interested in outdoor activities? yes
      //   2. Do you like museums? No
      //   3. Do you prefer German or international food? German
      //   The itinerary should be a json format look like this:
      //   [
      //   {
      //     "hour":9.00AM,
      //     "attraction" Checkpoint-Charlie,
      //     "duration": 2h,
      //   },
      //   .
      //   .
      //   .
      //   ]
      //   ''');
      //   print(inResponse);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
