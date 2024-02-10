import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'layout_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List science  =[
    'assets/images/Teaching-cuate.png',
    'assets/images/Teaching-bro.png',
    'assets/images/Teaching-amico.png'
  ];

  List math  =[
    'assets/images/Teaching-bro.png',
    'assets/images/Teaching-pana.png',
    'assets/images/Teaching-rafiki.png'
  ];
}
