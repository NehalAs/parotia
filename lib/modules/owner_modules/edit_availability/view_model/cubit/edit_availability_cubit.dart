import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parotia/modules/owner_modules/edit_availability/view_model/cubit/edit_availability_state.dart';

class EditAvailabilityCubit extends Cubit<EditAvailabilityState> {
  EditAvailabilityCubit() : super(EditAvailabilityInitial());

  static EditAvailabilityCubit get(context) => BlocProvider.of(context);

  bool blocDatesSwitch = false;

  void changeSwitchValue({required bool newValue}) {
    blocDatesSwitch = newValue;
    emit(ChangeSwitchValueState());
  }

  getCurrentSwitchValue(
      {required String rentalId, required List<DateTime> days}) async {
    List? currentUnAvailableDays = await getUnAvailableDays(rentalId: rentalId);
    bool currentSwitchValue = days.any(
      (element) =>
          currentUnAvailableDays!.contains(element.toString().split('Z')[0]),
    );
    changeSwitchValue(newValue: currentSwitchValue);
  }

  void editDaysAvailability({
    required String rentalId,
    required List<DateTime> days,
  }) async {
    emit(EditAvailabilityLoadingState());
    List<dynamic> newUnavailableDays = [];
    List? currentUnAvailableDays = await getUnAvailableDays(rentalId: rentalId);
    List stringDays =
        days.map((date) => date.toString().split('Z')[0]).toList();
    //changeSwitchValue(newValue: !blocDatesSwitch);
    if (blocDatesSwitch) {
      currentUnAvailableDays!.addAll(stringDays);
      newUnavailableDays = currentUnAvailableDays;
    } else {
      currentUnAvailableDays!.removeWhere(
        (element) => stringDays.contains(element),
      );
      newUnavailableDays = currentUnAvailableDays;
    }

    Map? oldCalender = await getOldCalender(rentalId: rentalId);
    FirebaseFirestore.instance.collection('products').doc(rentalId).update({
      'calender': {
        'daysPrices': await oldCalender?['daysPrices'],
        'notAvailableDays': newUnavailableDays,
      }
    }).then(
      (value) {
        emit(EditAvailabilitySuccessState());
      },
    ).catchError((error) {
      emit(EditAvailabilityErrorState());
      print(error.toString());
    });
  }

  Future<List?> getUnAvailableDays({
    required String rentalId,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> rentalData = await FirebaseFirestore
        .instance
        .collection('products')
        .doc(rentalId)
        .get();
    return rentalData.data()?['calender']['notAvailableDays'];
  }

  Future<Map?> getOldCalender({
    required String rentalId,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> rentalData = await FirebaseFirestore
        .instance
        .collection('products')
        .doc(rentalId)
        .get();
    return rentalData.data()?['calender'];
  }
}
