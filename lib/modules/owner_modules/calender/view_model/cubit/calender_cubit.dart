import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parotia/modules/owner_modules/calender/view_model/cubit/calender_state.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit() : super(CalenderInitial());

  static CalenderCubit get(context) => BlocProvider.of(context);

  void editDaysPrices(
      {required String rentalId,
      required List<DateTime> days,
      required int newPrice}) async {
    emit(EditPricesLoadingState());
    Map<String, dynamic> daysNewPricesMap = {};
    days.forEach(
      (element) {
        daysNewPricesMap[element.toString().split('Z')[0]] = newPrice;
      },
    );
    Map<dynamic, dynamic>? oldRentalPrices =
        await getOldPrices(rentalId: rentalId);
    oldRentalPrices?.forEach(
      (key, value) {
        if (!daysNewPricesMap.containsKey(key)) {
          daysNewPricesMap[key] = value;
        }
      },
    );

    Map<dynamic, dynamic>? oldCalender =
        await getOldCalender(rentalId: rentalId);
    FirebaseFirestore.instance.collection('products').doc(rentalId).update({
      'calender': {
        'daysPrices': daysNewPricesMap,
        'notAvailableDays': oldCalender?['notAvailableDays'],
      }
    }).then((value) {
      emit(EditPricesSuccessState());
    },).catchError((error){
      emit(EditPricesErrorState());
      print(error.toString());
    });
  }

  Future<Map?> getOldPrices({
    required String rentalId,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> rentalData = await FirebaseFirestore
        .instance
        .collection('products')
        .doc(rentalId)
        .get();
    return rentalData.data()?['calender']['daysPrices'];
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
