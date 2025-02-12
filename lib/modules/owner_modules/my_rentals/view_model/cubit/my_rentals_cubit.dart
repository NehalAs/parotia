import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parotia/modules/owner_modules/my_rentals/view_model/cubit/my_rentals_state.dart';

import '../../models/rental_model.dart';

class MyRentalsCubit extends Cubit<MyRentalsState> {
  MyRentalsCubit() : super(MyRentalsInitial()){
    getMyRentals();
  }

  static MyRentalsCubit get(context) => BlocProvider.of(context);

  List<RentalModel> myRentals=[];
  void getMyRentals() {
    emit(GetMyRentalsLoadingState());
    FirebaseFirestore.instance.collection('products').get().then(
      (value) {
        value.docs.forEach((element) {
          myRentals.add(RentalModel.fromJson(element.data()));

        });
        print('success');

        emit(GetMyRentalsSuccessState());
      },
    ).catchError((error) {
      log('$error');
      emit(GetMyRentalsErrorState());
    });
  }
}
