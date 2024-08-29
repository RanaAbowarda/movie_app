import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/Model/brows_model.dart';
import 'package:movie_app/apis/api_constants.dart';
import 'package:movie_app/cubits/brows_category_cubit/brows_category_states.dart';
import 'package:http/http.dart' as http;

class BrowsCategoryViewModel extends Cubit<BrowsCategoryStates> {
  BrowsModel? browsModel;
  List<Genres> genresList = [];
  BrowsCategoryViewModel() : super(BrowsCategoryLoadingState());
  void getBrowsCatogry() async {
    emit(BrowsCategoryLoadingState());
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.browsEndPoint);
    http.Response response = await http.get(url, headers: ApiConstants.headers);
    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var json = jsonDecode(data);
        browsModel = BrowsModel.fromJson(json);
        genresList = browsModel!.genres!;

        emit(BrowsCategorySuccessState());
      } else {
        emit(BrowsCategoryErrorState(errorMessage: browsModel!.statusMessage!));
      }
    } on Exception catch (e) {
      emit(BrowsCategoryErrorState(errorMessage: e.toString()));
      // TODO
    }
  }
}
