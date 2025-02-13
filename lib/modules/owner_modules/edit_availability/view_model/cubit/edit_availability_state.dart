
sealed class EditAvailabilityState {}

final class EditAvailabilityInitial extends EditAvailabilityState {}
final class ChangeSwitchValueState extends EditAvailabilityState {}
final class EditAvailabilityErrorState extends EditAvailabilityState {}
final class EditAvailabilitySuccessState extends EditAvailabilityState {}
final class EditAvailabilityLoadingState extends EditAvailabilityState {}
