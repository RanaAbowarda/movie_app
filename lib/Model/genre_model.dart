class GenreModel {
  int id;

  String name;
  String image;

  GenreModel({required this.id, required this.image, required this.name});

  static List<GenreModel> getGenre() {
    return [
      GenreModel(id: 28, image: "assets/images/action.jpeg", name: "Action"),
      GenreModel(
          id: 12, image: "assets/images/advanter.jpg", name: "Adventure"),
      GenreModel(
          id: 16, image: "assets/images/animation.jpeg", name: "Animation"),
      GenreModel(id: 35, image: "assets/images/comedy.jpeg", name: "Comedy"),
      GenreModel(id: 80, image: "assets/images/crime.jpeg", name: "Crime"),
      GenreModel(
          id: 99, image: "assets/images/Documentary.jpeg", name: "Documentary"),
      GenreModel(id: 18, image: "assets/images/Drama.jpg", name: "Drama"),
      GenreModel(id: 10751, image: "assets/images/Family.jpeg", name: "Family"),
      GenreModel(id: 14, image: "assets/images/Fantasy.jpeg", name: "Fantasy"),
      GenreModel(id: 36, image: "assets/images/History.jpeg", name: "History"),
      GenreModel(id: 27, image: "assets/images/Horror.jpg", name: "Horror"),
      GenreModel(id: 10402, image: "assets/images/Music.jpeg", name: "Music"),
      GenreModel(
          id: 9648, image: "assets/images/Mystery.jpeg", name: "Mystery"),
      GenreModel(
          id: 10749, image: "assets/images/Romance.jpeg", name: "Romance"),
      GenreModel(
          id: 878,
          image: "assets/images/Science Fiction.jpeg",
          name: "Science Fiction"),
      GenreModel(
          id: 10770, image: "assets/images/TV Movie.jpeg", name: "TV Movie"),
      GenreModel(
          id: 53, image: "assets/images/Thriller.jpeg", name: "Thriller"),
      GenreModel(id: 10752, image: "assets/images/War.jpeg", name: "War"),
      GenreModel(id: 37, image: "assets/images/Western.jpeg", name: "Western"),
    ];
  }
}
