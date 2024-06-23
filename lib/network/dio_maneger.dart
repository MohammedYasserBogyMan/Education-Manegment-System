import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/register_model.dart';
import 'dio_client.dart';
import 'endpoints.dart';

class DioManager {
  DioClient dioClient = DioClient(Dio());

  Future<Either<String, RegisterModel>> sendRegisterAsync(
      {required String email,
      required String firstname,
      required String lastname,
      required String password,
     }) async {
    try {
      Response response = await dioClient.post(
        Endpoints.register,
        data: {
          "email": email,
          "first_name": firstname,
          "last_name": lastname,
          "password": password,

        },
      );

      return Right(RegisterModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(
          RegisterModel.fromJson(e.response!.data).message!.toString());
    }
  }
  Future<Either<String, RegisterModel>> sendLoginAsync(
      {required String email,
      required String password,
     }) async {
    try {
      Response response = await dioClient.post(
        Endpoints.login,
        data: {
          "email": email,
          "password": password,

        },
      );

      return Right(RegisterModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(
          RegisterModel.fromJson(e.response!.data).message!.toString());
    }
  }













}
