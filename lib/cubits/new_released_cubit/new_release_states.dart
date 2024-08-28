abstract class NewReleasedState {}

class NewReleasedLoadingState extends NewReleasedState {}

class NewReleasedErrorState extends NewReleasedState {
  String errorMessage;

  NewReleasedErrorState({required this.errorMessage});
}

class NewReleasedSuccessState extends NewReleasedState {}
