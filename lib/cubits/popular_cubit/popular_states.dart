abstract class PopularStates {}

class PopularLoadingStat extends PopularStates {}

class PopularErrorStat extends PopularStates {
  String errorMessage;
  PopularErrorStat({required this.errorMessage});
}

class PopularSuccessStat extends PopularStates {}
