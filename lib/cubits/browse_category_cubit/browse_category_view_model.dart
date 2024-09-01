import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Model/PopularMovies.dart';
import 'package:movie_app/apis/api_constants.dart';

import '../../Model/BrowseModel.dart';
import 'browse_category_states.dart';

class BrowseCategoryViewModel extends Cubit<BrowseCategoryStates> {
  BrowseModel? browsModel;
  List<Results> genresList = [];

  BrowseCategoryViewModel() : super(BrowseCategoryLoadingState());

  void getBrowsCategory(int id) async {
    emit(BrowseCategoryLoadingState());
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.browsEndPoint,
        {"with_genres": "$id"});
    http.Response response = await http.get(url, headers: ApiConstants.headers);
    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var json = jsonDecode(data);
        browsModel = BrowseModel.fromJson(json);
        genresList = browsModel!.results!;

        emit(BrowseCategorySuccessState());
      } else {
        emit(
            BrowseCategoryErrorState(errorMessage: browsModel!.statusMessage!));
      }
    } on Exception catch (e) {
      emit(BrowseCategoryErrorState(errorMessage: e.toString()));
    }
  }
}
