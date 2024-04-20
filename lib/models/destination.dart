class Destination {
  final double latitude;
  final double longitude;
  final String destinationName;
  final int destinationId;

  Destination(
      {required this.latitude,
      required this.longitude,
      required this.destinationName,
      required this.destinationId});

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      latitude: json['latitude'],
      longitude: json['longitude'],
      destinationName: json['destinationName'],
      destinationId: json['destinationId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'destinationName': destinationName,
      'destinationId': destinationId,
    };
  }
}

List<Destination> decodeDestinations(Map<String, dynamic> jsonResponse) {
  final data = jsonResponse['data'];
  List<Destination> attractions = [];
  for (var destination in data) {
    attractions.add(Destination.fromJson(destination));
  }
  return attractions;
}
