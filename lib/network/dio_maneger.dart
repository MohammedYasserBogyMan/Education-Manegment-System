import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/error.dart';
import '../models/error_model_login.dart';
import '../models/login_model.dart';
import '../models/new.dart';
import '../models/new_login.dart';
import '../models/new_sdsad.dart';
import '../models/register_model.dart';
import 'dio_client.dart';
import 'endpoints.dart';

class DioManager {
  DioClient dioClient = DioClient(Dio());

  Future<Either<String, NewLogin>> sendRegisterAsync(
      {required String email,
      required String firstname,
      required String lastname,
      required String password,
     }) async {
    try {
      Response response = await dioClient.post(
        Endpoints.register,
        queryParameters: {
          "email": email,
          "first_name": firstname,
          "last_name": lastname,
          "password": password,

        },
      );

      return Right(NewLogin.fromJson(response.data));
    } on DioException catch (e) {
      return Left(
          ErrorModel.fromJson(e.response!.data).message!.toString());
    }
  }
  Future<Either<String, NewLogin>> sendLoginAsync(
      {required String email,
      required String password,
     }) async {
    try {
      Response response = await dioClient.post(
        Endpoints.login,
        queryParameters: {
          "email": email,
          "password": password,

        },
      );

      return Right(NewLogin.fromJson(response.data));
    } on DioException catch (e) {
      return Left(
          ErrorModelLogin.fromJson(e.response!.data).message!.toString());
    }
  }













}
