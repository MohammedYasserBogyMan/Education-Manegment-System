
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/network/dio_maneger.dart';

import '../../../models/register_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPasswordLogin = true;
DioManager dioManager =DioManager();
  RegisterModel loginModel=RegisterModel();
  void changePasswordLoginVisible() {
    isPasswordLogin = !isPasswordLogin;
    emit(VisiblePasswordLoginState());
  }
  Future<void> userLogin() async {
    emit(LoginLoadingState());
    Either<String, RegisterModel> sendLogin = await dioManager.sendLoginAsync(email: phoneController.text
        , password: passwordController.text

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
