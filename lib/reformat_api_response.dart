import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:itiner_ai/models/attraction.dart';

Future<void> main(List<String> arguments) async {
  final resp = await rootBundle.loadString('viator_resp.json');
  final data = await json.decode(resp);

  // Parse JSON string into a list of attractions

  // Extract required fields from each attraction in each list
  final attractions = decodeAttractions(data);
  print("attractions!!");
  print(attractions.map((e) => e.toJson()));
}

List<Attraction> decodeAttractions(Map<String, dynamic> jsonResponse) {
  final data = jsonResponse['data'];
  List<Attraction> attractions = [];
  for (var attraction in data) {
    attractions.add(Attraction.fromJson(attraction));
  }
  return attractions;
}
