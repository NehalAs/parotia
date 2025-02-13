import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parotia/modules/vistors_modules/visitor_home/view_model/cubit/visitor_home_state.dart';
import '../../../../owner_modules/my_rentals/models/rental_model.dart';

class VisitorHomeCubit extends Cubit<VisitorHomeState> {
  VisitorHomeCubit() : super(VisitorHomeInitial()){
    getAllRentals();
  }

  static VisitorHomeCubit get(context) => BlocProvider.of(context);

  List<RentalModel> allRentals=[];
  void getAllRentals() {
    emit(GetAllRentalsLoadingState());
    FirebaseFirestore.instance.collection('products').get().then(
          (value) {
        value.docs.forEach((element) {
          allRentals.add(RentalModel.fromJson(element.data()));

        });
        print('success');

        emit(GetAllRentalsSuccessState());
      },
    ).catchError((error) {
      log('$error');
      emit(GetAllRentalsErrorState());
    });
  }
}
