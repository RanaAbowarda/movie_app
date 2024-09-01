abstract class BrowseCategoryStates {}

class BrowseCategoryLoadingState extends BrowseCategoryStates {}

class BrowseCategoryErrorState extends BrowseCategoryStates {
  String errorMessage;

  BrowseCategoryErrorState({required this.errorMessage});
}

class BrowseCategorySuccessState extends BrowseCategoryStates {}
