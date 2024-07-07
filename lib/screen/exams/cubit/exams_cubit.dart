// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/screen/exams/widget/all_screen.dart';

import '../../../models/exame_model.dart';
import '../../../network/dio_maneger.dart';
import '../widget/done_screen.dart';
import '../widget/to_do_screen.dart';

part 'exams_state.dart';

class ExamsCubit extends Cubit<ExamsState> {
  ExamsCubit() : super(ExamsInitial());

  static ExamsCubit get(context) => BlocProvider.of(context);
  final SearchController = TextEditingController();
  int initialActive = 1;
  Widget isActiveScreen = const AllScreen();
  List<Widget> Screens = [
    const AllScreen(),
    const ToDoScreen(),
    const DoneScreen(),
  ];

  bool isSeller = true;

  void changeSeller() {
    isSeller = !isSeller;
    emit(ChangeSellerState());
  }
  List<Color> colorListAll = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.indigoAccent,
  ];
  List<Color> colorListTo = [
    Colors.purpleAccent,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.indigoAccent,
  ];
  List<Color> colorListDone = [
    Colors.teal,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.indigoAccent,
  ];

  void changeActiveButton(int index) {
    initialActive = index;
    isActiveScreen = Screens[index];
    emit(ChangeBottomActive());
  }
  ExameModel exameModel =ExameModel();
  late String errorMessage;
  DioManager dioManager =DioManager();
  Future<void> getExam() async {
    emit(ProfileLoadingState());
    Either<String, ExameModel> sendLogin = await dioManager.getExameAsync(
    );
    sendLogin.fold((left) {
      errorMessage = left;

      emit(ProfileErrorState());
    }, (right) {
      exameModel = right;

      emit(ProfileSuccessState());
    });
  }
}
