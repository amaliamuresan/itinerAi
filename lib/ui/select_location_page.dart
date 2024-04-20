import 'package:flutter/material.dart';
import 'package:itiner_ai/models/destination.dart';
import 'package:itiner_ai/services/viator_service.dart';
import 'package:itiner_ai/ui/destination_chip.dart';

class SelectLocationPage extends StatefulWidget {
  const SelectLocationPage({Key? key}) : super(key: key);

  @override
  _SelectLocationPageState createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {
  late Future<dynamic> future;

  @override
  void initState() {
    super.initState();
    future = ViatorService().getDestinations();
  }

  Destination? selectedDestination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Select location"),
          SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: FutureBuilder(
                  future: future,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                          child: Wrap(
                        children: (snapshot.data as List<Destination?>)
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedDestination = e;
                                      });
                                    },
                                    child: DestinationChip(
                                      text: e?.destinationName ?? '',
                                      isSelected: selectedDestination == e,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: Expanded(
              child: ElevatedButton(
                  onPressed: selectedDestination != null ? () {} : null,
                  child: const Text("Next")),
            ),
          )
        ],
      ),
    );
  }
}
