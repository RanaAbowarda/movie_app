class Movie {
  String title;
  String originalTitle;
  String image;
  String releasedDate;

  Movie({
    required this.title,
    required this.originalTitle,
    required this.image,
    required this.releasedDate,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "originalTitle": originalTitle,
      "image": image,
      "releasedDate": releasedDate,
    };
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] as String,
      originalTitle: json['originalTitle'] as String,
      image: json['image'] as String,
      releasedDate: json['releasedDate'] as String,
    );
  }
}
