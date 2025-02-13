sealed class CalenderState {}

final class CalenderInitial extends CalenderState {}

final class EditPricesLoadingState extends CalenderState {}

final class EditPricesErrorState extends CalenderState {}

final class EditPricesSuccessState extends CalenderState {}
