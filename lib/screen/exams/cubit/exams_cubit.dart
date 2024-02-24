import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/screen/exams/widget/all_screen.dart';

import '../widget/done_screen.dart';
import '../widget/to_do_screen.dart';

part 'exams_state.dart';

class ExamsCubit extends Cubit<ExamsState> {
  ExamsCubit() : super(ExamsInitial());

  static ExamsCubit get(context) => BlocProvider.of(context);
  final SearchController = TextEditingController();
  int initialActive = 1;
  Widget isActiveScreen = AllScreen();
  List<Widget> Screens = [
    const AllScreen(),
    const ToDoScreen(),
    const DoneScreen(),
  ];
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
}
