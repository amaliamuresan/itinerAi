import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:itiner_ai/models/attraction.dart';
import 'package:itiner_ai/models/destination.dart';
import 'package:itiner_ai/reformat_api_response.dart';

class ViatorService {
  static String baseUrl = 'https://api.viator.com/partner';
  static String usersEndpointForLocations = '/v1/taxonomy/destinations';
  static String usersEndpointForAttractions = '/v1/taxonomy/attractions';

  static Map<String, String> headers = {
    "exp-api-key": ,
    // "Accept-Language": "en",
    "Content-Type": "application/json",
    // "Accept": "application/json;version=2.0"
  };

  Future<List<Destination>?> getDestinations() async {
    try {
      var response = await http.get(
        Uri.parse("$baseUrl$usersEndpointForLocations"),
        headers: headers,
      );
      final data = await json.decode(response.body);
      return decodeDestinations(data);
    } catch (e) {
      print("error $e");
    }
    return null;
  }

  Future<List<Attraction>?> getAttractions(int destinationId) async {
    try {
      var response = await http.post(
          Uri.parse("$baseUrl$usersEndpointForAttractions"),
          headers: headers,
          body: jsonEncode({"destId": destinationId, "topX": "1-20"}));
      final data = await json.decode(response.body);
      return decodeAttractions(data);
    } catch (e) {
      print("error $e");
    }
    return null;
  }
}
