import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Model/PopularMovies.dart';
import 'package:movie_app/apis/api_constants.dart';
import 'package:movie_app/cubits/popular_cubit/popular_states.dart';

class PopularViewModel extends Cubit<PopularStates> {
  PopularViewModel() : super(PopularLoadingState());
  PopularMovies? popularMovies;
  List<Results> resultList = [];
  void getPopular() async {
    try {
      emit(PopularLoadingState());
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.popularEndPoint);
      http.Response response =
          await http.get(url, headers: ApiConstants.headers);
      if (response.statusCode == 200) {
        String data = response.body;
        var json = jsonDecode(data);
        // print(data);
        popularMovies = PopularMovies.fromJson(json);
        resultList = popularMovies!.results!;
        print(
            '======================================== ${resultList[2].backdropPath}');
        emit(PopularSuccessState());
      } else {
        emit(PopularErrorState(errorMessage: popularMovies!.statusMessage!));
      }
    } on Exception catch (e) {
      emit(PopularErrorState(errorMessage: e.toString()));
    }
  }
}
