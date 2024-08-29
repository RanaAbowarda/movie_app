import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Model/PopularMovies.dart';
import 'package:movie_app/Model/Recommended%20.dart';
import 'package:movie_app/apis/api_constants.dart';
import 'package:movie_app/cubits/recommended_cubit/recommended_states.dart';

class RecommendedViewModel extends Cubit<RecommendedState> {
  RecommendedViewModel() : super(RecommendedLoadingState());
  Recommended? recommended;
  List<Results> recommendList = [];

  Future<void> getRecommended() async {
    try {
      emit(RecommendedLoadingState());
      Uri url =
          Uri.https(ApiConstants.baseUrl, ApiConstants.recommendedEndPoint);
      http.Response response =
          await http.get(url, headers: ApiConstants.headers);
      if (response.statusCode == 200) {
        String data = response.body;
        var json = jsonDecode(data);
        // print(data);
        recommended = Recommended.fromJson(json);
        recommendList = recommended!.results!;

        emit(RecommendedSuccessState());
      } else {
        emit(RecommendedErrorState(errorMessage: recommended!.statusMessage!));
      }
    } on Exception catch (e) {
      emit(RecommendedErrorState(errorMessage: e.toString()));
    }
  }
}
