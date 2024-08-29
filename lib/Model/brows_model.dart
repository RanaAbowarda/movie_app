class BrowsModel {
  List<Genres>? genres;
  bool? success;
  String? statusMessage;

  BrowsModel({this.genres, this.success, this.statusMessage});
  BrowsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusMessage = json['status_message'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((element) {
        genres?.add(Genres.fromJson(element));
      });
    }
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
