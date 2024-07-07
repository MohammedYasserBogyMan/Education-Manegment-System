part of 'exams_cubit.dart';

@immutable
abstract class ExamsState {}

class ExamsInitial extends ExamsState {}

class ChangeBottomActive extends ExamsState {}
class ChangeSellerState extends ExamsState {}
final class ProfileLoadingState extends ExamsState {}
final class ProfileErrorState extends ExamsState {}
final class ProfileSuccessState extends ExamsState {}
