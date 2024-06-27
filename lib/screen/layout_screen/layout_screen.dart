// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school/shared/nav.dart';
import '../../shared/color.dart';
import 'cubit/layout_cubit.dart';
import 'notification_screen.dart';

class LayoutScreen extends StatelessWidget {
  final zoomController;

  const LayoutScreen({Key? key, this.zoomController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              cubit.title[cubit.currenttitle],
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            elevation: 0,
            backgroundColor: AppColors.colorBackGroundApp,
            leading: Padding(
              padding: const EdgeInsets.only(right: 30, top: 5),
              child: InkWell(
                onTap: () => zoomController.toggle(),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey)),
                  child: const Icon(
                    IconlyBroken.category,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            actions: [
              GestureDetector(
                  onTap: () {
                    navigateTo(context, const NotificationScreen());
                  },
                  child: SvgPicture.asset(
                    'assets/icons/notification_.svg',
                    height: 35.h,
                    width: 35.w,
                  ))
            ],
          ),
          body: cubit.screen[cubit.current],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeIndex(index);
            },
            currentIndex: cubit.current,
            iconSize: 20,
            backgroundColor: AppColors.colorBackGroundApp,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.white,
            selectedLabelStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, height: 0.8),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.clipboard), label: 'Schedule'),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.calendar), label: 'Attendance'),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.file), label: 'Exams'),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.chartColumn), label: 'Statics'),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.book), label: 'Assiments'),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: Colors.purple[200],
          //   onPressed:(){  },
          //   tooltip: 'Increment',
          //   child: const Icon(Icons.add),
          // ),
        );
      },
    );
  }
}

Widget overlapped() {
  const overlap = 35.0;
  final items = [
    Container(
        padding: const EdgeInsets.all(2.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
            backgroundColor: Colors.red,
            child: Image.asset('assets/icons/1.png'))),
    Container(
        padding: const EdgeInsets.all(2.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
            backgroundColor: Colors.green,
            child: Image.asset('assets/icons/2.png'))),
    Container(
        padding: const EdgeInsets.all(2.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Image.asset('assets/icons/3.png'))),
    Container(
        padding: const EdgeInsets.all(2.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Image.asset('assets/icons/6.png'))),
    Container(
        padding: const EdgeInsets.all(2.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
            backgroundColor: Colors.purple[100],
            child: Text(
              '9',
              style: TextStyle(color: Colors.grey[600], fontSize: 20),
            ))),
  ];

  List<Widget> stackLayers = List<Widget>.generate(items.length, (index) {
    return Padding(
      padding: EdgeInsets.fromLTRB(index.toDouble() * overlap, 0, 0, 0),
      child: items[index],
    );
  });

  return Stack(children: stackLayers);
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height / 2); // Start at the center
    path.quadraticBezierTo(
      size.width / 4,
      size.height / 2 - 20, // Adjust this value for the control point
      size.width / 2,
      size.height / 2, // End at the center
    );
    path.quadraticBezierTo(
      3 * size.width / 4,
      size.height / 2 + 20, // Adjust this value for the control point
      size.width,
      size.height / 2, // End at the center
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
