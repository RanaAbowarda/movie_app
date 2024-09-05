abstract class SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchErrorState extends SearchStates {
  String errorMessage;
  SearchErrorState({required this.errorMessage});
}

class SearchSuccessState extends SearchStates {}

