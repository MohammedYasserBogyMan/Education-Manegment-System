import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:school/screen/layout_parent_screens/Parent_home_page/parent_home.dart';

import '../../profile/profile_screen.dart';

part 'parent_state.dart';

class ParentCubit extends Cubit<ParentState> {
  ParentCubit() : super(ParentInitial());
  static ParentCubit get(context) => BlocProvider.of(context);
  TextEditingController HolderNamecontroller = TextEditingController();
  TextEditingController CardNumbercontroller = TextEditingController();
  TextEditingController MMcontroller = TextEditingController();
  TextEditingController CVVcontroller = TextEditingController();
  int current = 0;
  List<Widget> screen = [
    const ParentHomeScreen(),
    const ProfileScreen(),
  ];
  void changeIndex(int index) {
    // if (index == 2) {
    //   return null;
    // }
    current = index;

    emit(AppChangeBottomNavBarState());
  }

  void setState() {
    emit(setStateState());
  }

  //CreditCardDetailsScreen
  //ProfileScreen
}
