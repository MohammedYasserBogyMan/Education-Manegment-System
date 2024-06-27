// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:school/screen/exams/cubit/exams_cubit.dart';
import 'package:school/screen/home_/cubit/layout_cubit.dart';
import 'package:school/screen/layout_parent_screens/Parent_home_page/parent_home.dart';
import 'package:school/screen/layout_parent_screens/cubit/parent_cubit.dart';
import 'package:school/screen/layout_screen/cubit/layout_cubit.dart';
import 'package:school/screen/layout_screen/layout_screen.dart';
import 'package:school/screen/login/cubit/login_cubit.dart';
// ignore: unused_import
import 'package:school/screen/login/login_screen.dart';
import 'package:school/screen/register/cubit/register_cubit.dart';
// ignore: unused_import
import 'package:school/screen/register/register_screen.dart';
import 'package:school/screen/schedules/cubit/schedules_cubit.dart';
import 'package:school/shared/color.dart';

import 'choise.dart';
import 'local_storage/shared_preferences_manager.dart';
import 'network/bloc_observer.dart';
import 'screen/menu_screen/menu.dart';
import 'screen/parent_screens/Parent_home_page/parent_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LayoutCubit>(create: (context) => LayoutCubit()),
        BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
        BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<SchedulesCubit>(create: (context) => SchedulesCubit()),
        BlocProvider<ExamsCubit>(create: (context) => ExamsCubit()),
        BlocProvider<ParentCubit>(create: (context) => ParentCubit())
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Assignment App',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.colorBackGroundApp,
            primarySwatch: Colors.purple,
          ),
          // ignore: prefer_const_constructors
<<<<<<< HEAD
          home: ParentHomeScreen(),
=======
          home: ChoiseUser(),
>>>>>>> 0242002c22aaee83ff9d96eed7f6ac28970d827f
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackGroundApp,
      body: ZoomDrawer(
        controller: _drawerController,
        style: DrawerStyle.defaultStyle,
        menuScreen: const MenuScreen(),
        mainScreen: LayoutScreen(
          zoomController: _drawerController,
        ),
        borderRadius: 24.0,
        showShadow: false,
        angle: 0.0,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        closeCurve: Curves.bounceIn,
      ),
    );
  }
}
