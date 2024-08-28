abstract class PopularStates {}

class PopularLoadingState extends PopularStates {}

class PopularErrorState extends PopularStates {
  String errorMessage;
  PopularErrorState({required this.errorMessage});
}

class PopularSuccessState extends PopularStates {}
