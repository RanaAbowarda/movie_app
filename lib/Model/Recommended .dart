import 'PopularMovies.dart';

class Recommended {
  Recommended(
      {this.page,
      this.results,
      this.totalPages,
      this.totalResults,
      this.statusMessage});

  Recommended.fromJson(dynamic json) {
    page = json['page'];
    statusMessage = json['statusMessage'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  int? page;
  List<Results>? results;
  String? statusMessage;
  int? totalPages;
  int? totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
