sealed class VisitorHomeState {}

final class VisitorHomeInitial extends VisitorHomeState {}

final class GetAllRentalsLoadingState extends VisitorHomeState {}

final class GetAllRentalsSuccessState extends VisitorHomeState {}

final class GetAllRentalsErrorState extends VisitorHomeState {}
