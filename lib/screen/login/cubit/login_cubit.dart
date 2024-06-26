
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/network/dio_maneger.dart';

import '../../../models/login_model.dart';
import '../../../models/new.dart';
import '../../../models/new_login.dart';
import '../../../models/new_sdsad.dart';
import '../../../models/register_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPasswordLogin = true;
DioManager dioManager =DioManager();
  NewLogin loginModel=NewLogin();
  void changePasswordLoginVisible() {
    isPasswordLogin = !isPasswordLogin;
    emit(VisiblePasswordLoginState());
  }
  Future<void> userLogin() async {
    emit(LoginLoadingState());
    Either<String, NewLogin> sendLogin = await dioManager.sendRegisterAsync(email: "sffasfsf"
        , password: "passwordController.text", firstname: 'dsdsds', lastname: 'sadasd'

    );
    sendLogin.fold((left) {
      errorMessage = left;

      emit(LoginErrorState());
    }, (right) {
      loginModel = right;

      emit(LoginSuccessState());
    });
  }

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final rememberClient = true;


  late String errorMessage;


}
