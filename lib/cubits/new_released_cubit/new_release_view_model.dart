import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Model/NewReleases.dart';
import 'package:movie_app/Model/PopularMovies.dart';
import 'package:movie_app/apis/api_constants.dart';
import 'package:movie_app/cubits/new_released_cubit/new_release_states.dart';

class NewReleasedViewModel extends Cubit<NewReleasedState> {
  NewReleasedViewModel() : super(NewReleasedLoadingState());
  NewReleases? newReleases;
  List<Results> resultList = [];

  void getNewReleased() async {
    try {
      emit(NewReleasedLoadingState());
      Uri url =
          Uri.https(ApiConstants.baseUrl, ApiConstants.newReleasedEndPoint);
      http.Response response =
          await http.get(url, headers: ApiConstants.headers);
      if (response.statusCode == 200) {
        String data = response.body;
        var json = jsonDecode(data);
        // print(data);
        newReleases = NewReleases.fromJson(json);
        resultList = newReleases!.results!;

        emit(NewReleasedSuccessState());
      } else {
        emit(NewReleasedErrorState(errorMessage: newReleases!.statusMessage!));
      }
    } on Exception catch (e) {
      emit(NewReleasedErrorState(errorMessage: e.toString()));
    }
  }
}
