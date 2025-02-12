import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parotia/modules/owner_modules/calender/view_model/cubit/calender_state.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit() : super(CalenderInitial());

  static CalenderCubit get(context)=>BlocProvider.of(context);


}
