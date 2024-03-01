import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../exams/exams.dart';
import '../../home_/home_screen.dart';
import '../../profile/profile_screen.dart';
import '../../schedules/schedules_page.dart';
import '../../statistics/statistics_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<HomeState> {
  LayoutCubit() : super(HomeInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);
  int current = 0;
  List<Widget> screen = [
    HomeScreen(),
    SchedulesPage(),
    //DashBoardScreen(),
    AttendancePage(),
    ExamsScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    // if (index == 2) {
    //   return null;
    // }
    current = index;
    emit(AppChangeBottomNavBarState());
  }
}
