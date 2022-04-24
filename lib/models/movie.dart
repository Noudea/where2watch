import 'dart:convert';

/// Movie model
class Movie {
  int id;
  String title;
  String description;
  String image;
  num rate;
  Map locations;
  String video;
  int length;
  bool isLoading;
  List cast;

  Movie({
    this.id = 0,
    this.title = 'default',
    this.description = 'default',
    this.image = 'default',
    this.rate = 0,
    this.locations = const {},
    this.video = 'default',
    this.length = 0,
    this.isLoading = true,
    this.cast = const []
  });

  // ignore: todo
  /// convert movie to json, TODO : add all the fields
  String toJson() {
    String tojson = jsonEncode({
      'title': title,
      'image': image,
      'id': id,
      'rate': rate,
    });
    return tojson;
  }

  // ignore: todo
  /// convert json to movie TODO: add all the fields
  factory Movie.fromJson(String json) {
    var map = jsonDecode(json);
    return Movie(
      id: map['id'],
      title: map['title'],
      image: map['image'],
      rate: map['rate'],
    );
  }

}