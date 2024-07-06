import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:school/network/dio_maneger.dart';

import '../../../models/profile_model.dart';
import '../../../models/profile_s_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  ProfileSModel profileModel =ProfileSModel();
  late String errorMessage;
  DioManager dioManager =DioManager();
  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    Either<String, ProfileSModel> sendLogin = await dioManager.getProfileAsync(
      );
    sendLogin.fold((left) {
      errorMessage = left;

      emit(ProfileErrorState());
    }, (right) {
      profileModel = right;

      emit(ProfileSuccessState());
    });
  }

}
