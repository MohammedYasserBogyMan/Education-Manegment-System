import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/screen/assignments/assignments_screen.dart';
import 'package:school/screen/statistics/statistics_screen.dart';

import '../../exams/exams.dart';
import '../../home_/home_screen.dart';
import '../../schedules/schedules_page.dart';
import '../../attendans/statistics_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<HomeState> {
  LayoutCubit() : super(HomeInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);
  int current = 0;
  List<Widget> screen = [
    HomeScreen(),
    SchedulesPage(),
    AttendancePage(),
    ExamsScreen(),
    StatisticsScreen(),
    AssignmentsScreen(),
  ];
  int currenttitle=0;
  List<String> title=[
    '',
    'Schedule',
    'Attendance',
    'Exams',
    'Statistics',
    'Assignments',

  ];


  void changeIndex(int index) {
    // if (index == 2) {
    //   return null;
    // }
    current = index;
    currenttitle=index;
    emit(AppChangeBottomNavBarState());
  }
}
