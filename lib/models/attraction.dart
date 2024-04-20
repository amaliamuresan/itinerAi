class Attraction {
  final String title;
  final String webURL;
  final double attractionLatitude;
  final double attractionLongitude;
  final String thumbnailHiResURL;
  final String descriptionText;

  Attraction(
      {required this.attractionLatitude,
      required this.attractionLongitude,
      required this.title,
      required this.webURL,
      required this.thumbnailHiResURL,
      required this.descriptionText});

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      title: json['title'],
      webURL: json['webURL'],
      attractionLatitude: json['attractionLatitude'],
      attractionLongitude: json['attractionLongitude'],
      thumbnailHiResURL: json['thumbnailHiResURL'],
      descriptionText: json['descriptionText'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'webURL': webURL,
      'thumbnailHiResURL': thumbnailHiResURL,
      'attractionLatitude': attractionLatitude,
      'attractionLongitude': attractionLongitude,
      'descriptionText': descriptionText
    };
  }
}
