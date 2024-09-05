import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/Model/movie_model.dart';
import 'package:movie_app/Model/user_model.dart';

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
    await getMovieCollection().doc(movie.title).set(movie);
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
    return collection
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .snapshots();
  }

  static Future<bool> isMovieAdd(String title) async {
    var doc = await getMovieCollection().doc(title).get();
    return doc.exists;
  }

  static CollectionReference<UserModel> getUserCollections() {
    return FirebaseFirestore.instance
        .collection("users")
        .withConverter<UserModel>(
            fromFirestore: (snapshot, options) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (user, options) => user.toJson());
  }

  // Add user to fire store...
  static Future<void> addUser(UserModel userModel) {
    return getUserCollections().doc(userModel.id).set(userModel);
  }

  static Future<UserModel?> getUser() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return null;
    }
    var querySnapshot = await getUserCollections().doc(currentUser.uid).get();

    return querySnapshot.data();
  }
}
