abstract class BrowsCategoryStates {}

class BrowsCategoryLoadingState extends BrowsCategoryStates {}

class BrowsCategoryErrorState extends BrowsCategoryStates {
  String errorMessage;
  BrowsCategoryErrorState({required this.errorMessage});
}

class BrowsCategorySuccessState extends BrowsCategoryStates {}
