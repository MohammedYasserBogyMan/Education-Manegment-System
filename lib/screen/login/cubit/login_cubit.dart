
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPasswordLogin = true;

  void changePasswordLoginVisible() {
    isPasswordLogin = !isPasswordLogin;
    emit(VisiblePasswordLoginState());
  }


  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final rememberClient = true;


  late String errorMessage;


}
