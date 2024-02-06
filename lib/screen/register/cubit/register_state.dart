part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class ChangeState extends RegisterState {}

class ImagePickerNationalState extends RegisterState {}

class SendSignInLoadingState extends RegisterState {}

class SendSignInSuccessState extends RegisterState {}

class SendSignInErrorState extends RegisterState {}

class SendBusinessSignInLoadingState extends RegisterState {}

class SendBusinessSignInSuccessState extends RegisterState {}

class SendBusinessSignInErrorState extends RegisterState {}

class GetAllGovernoratesLoadingState extends RegisterState {}

class GetAllGovernoratesSuccessState extends RegisterState {}

class GetAllGovernoratesErrorState extends RegisterState {}

class ChangeGovState extends RegisterState {}

class DatePikerState extends RegisterState {}
