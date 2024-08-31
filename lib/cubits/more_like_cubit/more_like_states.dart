abstract class MoreLikeStates {}

class MoreLikeLoadingState extends MoreLikeStates {}

class MoreLikeErrorState extends MoreLikeStates {
  String errorMessage;
  MoreLikeErrorState({required this.errorMessage});
}

class MoreLikeSuccessState extends MoreLikeStates {}
