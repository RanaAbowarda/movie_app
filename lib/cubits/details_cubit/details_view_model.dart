import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Model/DetailsMovie.dart';
import 'package:movie_app/apis/api_constants.dart';
import 'package:movie_app/cubits/details_cubit/details_states.dart';

class DetailsViewModel extends Cubit<DetailsStates> {
  DetailsMovie? detailsMovie;
  List<DetailsGenres> genresList = [];
  DetailsViewModel() : super(DetailsLoadingState());
  void getMovieDetails(String movieId) async {
    emit(DetailsLoadingState());
    Uri url = Uri.https(ApiConstants.baseUrl, '/3/movie/$movieId');
    http.Response response = await http.get(url, headers: ApiConstants.headers);
    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var json = jsonDecode(data);
        detailsMovie = DetailsMovie.fromJson(json);
        genresList = detailsMovie!.genres!;

        emit(DetailsSuccessState());
      } else {
        emit(DetailsErrorState(errorMessage: detailsMovie!.statusMessage!));
      }
    } on Exception catch (e) {
      emit(DetailsErrorState(errorMessage: e.toString()));
    }
  }
}
