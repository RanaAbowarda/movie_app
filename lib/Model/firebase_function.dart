import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/Model/movie_model.dart';

class FirebaseFunction {
  static CollectionReference<Movie> getMovieCollection() {
    return FirebaseFirestore.instance.collection("Movies").withConverter<Movie>(
      fromFirestore: (snapshot, options) {
        return Movie.fromJson(snapshot.data()!);
      },
      toFirestore: (movie, options) {
        return movie.toJson();
      },
    );
  }

  static Future<void> addMovie(Movie movie) async {
    await getMovieCollection().add(movie);
  }

  static Future<void> deleteMovie(String title) async {
    var querySnapshot =
        await getMovieCollection().where("title", isEqualTo: title).get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        await getMovieCollection().doc(doc.id).delete();
      }
    }
  }

  static Stream<QuerySnapshot<Movie>> getMovie() {
    var collection = getMovieCollection();
    return collection.snapshots();
  }
}
