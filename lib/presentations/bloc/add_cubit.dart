// import 'package:bloc/bloc.dart';

// class AddCubit extends Cubit<AddState> {
//   AddCubit() : super(AddInitialState());
// }

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:myapp/presentations/bloc/add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddInitialState());

  int times = 5;

  TextEditingController numberController = TextEditingController();

  addTime() {
    emit(AddLoadingState());
    times += 1;
    emit(AddLoadedState(times: times));
  }

  subtractTime() {
    emit(AddLoadingState());
    times -= 1;
    emit(AddLoadedState(times: times));
  }

  addNumberToTime(int number) {
    emit(AddLoadingState());
    times +=
        numberController.text.isEmpty ? 0 : int.parse(numberController.text);
    emit(AddLoadedState(times: times));
  }
}
