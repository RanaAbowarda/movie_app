import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/Model/Search.dart';
import 'package:movie_app/cubits/search_cubit/search_state.dart';

import '../../Model/PopularMovies.dart';
import '../../apis/api_constants.dart';

class SearchViewModel extends Cubit<SearchStates> {
  SearchViewModel() : super(SearchLoadingState());
  Search? search;
  List<Results> searchList = [];
  List<Results> newSearch = [];
  String query = '';

  void getSearch(String query) async {
    try {
      emit(SearchLoadingState());
      Uri url = Uri.https(
          ApiConstants.baseUrl, ApiConstants.searchEndPoint, {"query": query});
      http.Response response = await http.get(url, headers: {
        'Authorization': ApiConstants.authorization,
        'accept': 'application/json',
      });
      if (response.statusCode == 200) {
        String data = response.body;
        var json = jsonDecode(data);
        // print(data);
        search = Search.fromJson(json);
        searchList = search!.results!;

        emit(SearchSuccessState());
      } else {
        emit(SearchErrorState(errorMessage: search!.statusMessage!));
      }
    } on Exception catch (e) {
      emit(SearchErrorState(errorMessage: e.toString()));
    }
  }
}
