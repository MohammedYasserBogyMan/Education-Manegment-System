// ignore_for_file: unused_local_variable, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';
import 'package:school/screen/register/Screens/main_register.dart';
import 'package:school/screen/register/Screens/sconed_regester.dart';
import 'package:school/screen/register/Screens/therd_regester.dart';
import 'package:school/shared/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/register_cubit.dart';

class Register_Page extends StatelessWidget {
  const Register_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return const Scaffold(
          body: MainPage(),
        );
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int page = 0;
  int counter = 3; // Number of pages
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackGroundApp,
      appBar: AppBar(
        title: const Text(
          'Student Registrition',
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _example1(),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                width: 500,
                height: 600, // Adjust the height as needed
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      page = index;
                    });
                  },
                  children: [
                    FirstRegistarPage(),
                    SconedRegeisterPage(),
                    TherdRegesterPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _example1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
      child: Container(
        decoration: const BoxDecoration(
            // color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.0),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              width: 300,
              height: 30,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: FlutterStepIndicator(
                  height: 28,
                  paddingLine: const EdgeInsets.symmetric(horizontal: 0),
                  positiveColor: const Color.fromARGB(255, 17, 101, 246),
                  progressColor: const Color.fromARGB(255, 81, 169, 213),
                  negativeColor: const Color(0xFFD5D5D5),
                  padding: const EdgeInsets.all(4),
                  list: List.generate(counter, (index) => index),
                  division: counter - 1,
                  onChange: (i) {},
                  page: page,
                  onClickItem: (p0) {
                    _pageController.animateToPage(
                      p0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
