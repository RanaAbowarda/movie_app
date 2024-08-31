import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Model/PopularMovies.dart';
import 'package:movie_app/Model/SimilarMovie.dart';
import 'package:movie_app/apis/api_constants.dart';
import 'package:movie_app/cubits/more_like_cubit/more_like_states.dart';
import 'package:http/http.dart' as http;

class MoreLikeViewModel extends Cubit<MoreLikeStates> {
  MoreLikeViewModel() : super(MoreLikeLoadingState());
  SimilarMovie? similarMovie;
  List<Results> similarResultsList = [];
  getmoreLike(String movieId) async {
    emit(MoreLikeLoadingState());
    Uri url = Uri.https(ApiConstants.baseUrl, '/3/movie/$movieId/similar');
    http.Response resopnse = await http.get(url, headers: ApiConstants.headers);
    try {
      if (resopnse.statusCode == 200) {
        String data = resopnse.body;
        var json = jsonDecode(data);
        similarMovie = SimilarMovie.fromJson(json);
        similarResultsList = similarMovie!.results!;
        emit(MoreLikeSuccessState());
      } else {
        emit(MoreLikeErrorState(errorMessage: similarMovie!.statusMessage!));
      }
    } catch (e) {
      emit(MoreLikeErrorState(errorMessage: e.toString()));
    }
  }
}
