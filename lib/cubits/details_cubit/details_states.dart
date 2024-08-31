abstract class DetailsStates {}

class DetailsLoadingState extends DetailsStates {}

class DetailsErrorState extends DetailsStates {
  String errorMessage;
  DetailsErrorState({required this.errorMessage});
}

class DetailsSuccessState extends DetailsStates {}
