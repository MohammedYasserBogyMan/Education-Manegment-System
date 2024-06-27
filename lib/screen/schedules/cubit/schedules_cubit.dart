import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../shared/color.dart';
import '../models/item_models.dart';
import '../week_day/MonScreen.dart';
import '../week_day/hurs_screen.dart';
import '../week_day/sun_screen.dart';
import '../week_day/tue_screen.dart';
import '../week_day/web_screen.dart';

part 'schedules_state.dart';

class SchedulesCubit extends Cubit<SchedulesState> {
  SchedulesCubit() : super(SchedulesInitial());

  static SchedulesCubit get(context) => BlocProvider.of(context);
  int initialActive = 1;
  Widget isActiveScreen = const SunScreen();
  List<Widget> Screens = [
    const SunScreen(),
    const MonScreen(),
    const TueScreen(),
    const WedScreen(),
    const HursScreen(),
  ];

  void changeActiveButton(int index) {
    initialActive = index;
    isActiveScreen = Screens[index];
    emit(ChangeBottomActive());
  }

  final List<ItemModels> itemModels = [
    ItemModels(
      color: AppColors.colorSecondary,
      titel: 'English',
      sTime: '09:00',
      eTime: '10:30',
      room: 'Room 1',
    ),
    ItemModels(
      color: AppColors.colorSecondary2,
      titel: 'Math',
      sTime: '10:30',
      eTime: '12:00',
      room: 'Room 3',
    ),
    ItemModels(
      color: AppColors.colorLightGreen,
      titel: 'Arabic',
      sTime: '12:00',
      eTime: '01:30',
      room: 'Room 2',
    ),
    ItemModels(
      color: AppColors.colorOrange,
      titel: 'Physics',
      sTime: '01:30',
      eTime: '03:00',
      room: 'Room 7',
    ),
    ItemModels(
      color: AppColors.colorOrange,
      titel: 'Geology',
      sTime: '03:00',
      eTime: '04:30',
      room: 'Room 5',
    ),
    ItemModels(
      color: AppColors.colorOrange,
      titel: 'Geology',
      sTime: '03:00',
      eTime: '04:30',
      room: 'Room 5',
    ),
    ItemModels(
      color: AppColors.colorOrange,
      titel: 'Geology',
      sTime: '03:00',
      eTime: '04:30',
      room: 'Room 5',
    ),
    ItemModels(
      color: AppColors.colorOrange,
      titel: 'Geology',
      sTime: '03:00',
      eTime: '04:30',
      room: 'Room 5',
    ),
  ];
}
