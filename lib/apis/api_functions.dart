// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:movie_app/Model/PopularMovies.dart';
// import 'package:movie_app/apis/api_constants.dart';

// class ApiFunctions {
//    Future<PopularMovies?> getPopular() async {
//     Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.popularEndPoint);
//     // --url 'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1' \
//     http.Response response = await http.get(url, headers: ApiConstants.headers);
  
//     String data = response.body;
//     var json = jsonDecode(data);
//     return PopularMovies.fromJson(json);
//   }
// }
