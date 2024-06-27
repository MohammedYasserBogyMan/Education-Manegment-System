// ignore_for_file: unused_catch_clause

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  late String errorMessage;

  bool isIndividual = true;

  void changeState({required bool action}) {
    isIndividual = action;
    emit(ChangeState());
  }

// individual side
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  String? selectedValue;
  List<String> gov = [];
  late int indexOfGov;
  File? imageIndividual;

  Future pickIndividualImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        final imageTemporary = File(image.path);
        imageIndividual = imageTemporary;
        emit(ImagePickerNationalState());
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Field to catch the image");
      }
    }
  }

  TimeOfDay timeNow = TimeOfDay.now();

  Future<void> displayDateIndividualPicker(BuildContext context) async {
    DateTime? time = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 10),
      firstDate: DateTime(1950),
      lastDate: DateTime(DateTime.now().year - 10),
    );
    dateController.text = DateFormat('yyyy-MMM-dd').format(time!).toString();
    emit(DatePikerState());
  }

// business side
  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessPasswordController = TextEditingController();
  TextEditingController businessConfirmPasswordController =
      TextEditingController();
  TextEditingController businessMailController = TextEditingController();
  TextEditingController businessCRNumberController = TextEditingController();
  TextEditingController businessIDNumberController = TextEditingController();
  TextEditingController businessBioController = TextEditingController();
  TextEditingController businessPhoneController = TextEditingController();
  TextEditingController businessDateController = TextEditingController();
  File? businessLogo;
  File? attachmentID;
  File? attachmentCR;

  Future<void> displayDateBusinessPicker(BuildContext context) async {
    DateTime? time = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    businessDateController.text =
        DateFormat('yyyy-MMM-dd').format(time!).toString();
    emit(DatePikerState());
  }

  Future pickBusinessImage({required int index}) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        final imageTemporary = File(image.path);
        switch (index) {
          case 0:
            {
              businessLogo = imageTemporary;
            }
            break;

          case 1:
            {
              attachmentID = imageTemporary;
            }
            break;

          case 2:
            {
              attachmentCR = imageTemporary;
            }
            break;
        }

        emit(ImagePickerNationalState());
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print("Field to catch the image");
      }
    }
  }
}
