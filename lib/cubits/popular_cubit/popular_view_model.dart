import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Model/PopularMovies.dart';
import 'package:movie_app/apis/api_constants.dart';
import 'package:movie_app/cubits/popular_cubit/popular_states.dart';
import 'package:http/http.dart' as http;

class PopularViewModel extends Cubit<PopularStates> {
  PopularViewModel() : super(PopularLoadingStat());
  Future<PopularMovies?> getPopular() async {
    emit(PopularLoadingStat());
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.popularEndPoint);
    try {
      // --url 'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1' \
      http.Response response =
          await http.get(url, headers: ApiConstants.headers);
      String data = response.body;
      var json = jsonDecode(data);
      print(data);
      return PopularMovies.fromJson(json);
    } catch (e) {
      emit(PopularErrorStat(errorMessage: e.toString()));
    }
  }
}
