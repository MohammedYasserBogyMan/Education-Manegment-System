// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/screen/attendans/widget.dart';
import 'package:school/shared/color.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  bool isDaySelected(DateTime day) {
    List<int> excludedDays = [5, 10, 9, 19, 30];
    return !excludedDays.contains(day.day);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorBackGroundApp,
        title: Text('Track and manage your attendance records here.',
            style: TextStyle(color: Colors.white, fontSize: 18.sp)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TableCalendar(
              firstDay: DateTime.utc(2024, 1, 1),
              lastDay: DateTime.utc(2024, 12, 31),
              focusedDay: DateTime.utc(2024, 12, 31),
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 24.sp),
                formatButtonVisible: false,
                leftChevronIcon: const Icon(
                  Icons.arrow_left,
                  color: Colors.white,
                  size: 30,
                ),
                rightChevronIcon: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              selectedDayPredicate: isDaySelected,
              calendarStyle: CalendarStyle(
                defaultTextStyle: const TextStyle(color: Colors.white),
                todayTextStyle: const TextStyle(color: Colors.green),
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: isDaySelected(DateTime.now())
                      ? AppColors.colorBackGroundApp
                      : AppColors.colorBackGroundApp,
                  border: Border.all(
                    width: 1,
                    color: Colors.green,
                  ),
                ),
              ),
              // Other properties and customization options...
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                  child: FadeInAnimation(
                    delay: 1.5,
                    child: AppCard(
                      height: 180,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  'assets/images/true.png',
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ],
                          ),
                          const Expanded(
                            child: ProgressWithText(
                              value: 30,
                              indicatorValue: .99,
                              title: 'attendance',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: FadeInAnimation(
                    delay: 1.5,
                    child: AppCard(
                      height: 180,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  'assets/images/false.png',
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ],
                          ),
                          const Expanded(
                            child: ProgressWithText(
                              value: 1,
                              indicatorValue: .1,
                              title: 'absence',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
            // Add your other widgets or customize the layout as needed
          ],
        ),
      ),
    );
  }
}
// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:school/screen/statistics/widget.dart';
//
// class DashBoardScreen extends StatefulWidget {
//   const DashBoardScreen({super.key});
//
//   @override
//   State<DashBoardScreen> createState() => _DashBoardScreenState();
// }
//
// class _DashBoardScreenState extends State<DashBoardScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double w = (MediaQuery.sizeOf(context).width / 2) - 35;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: [
//             const SizedBox(height: 70),
//             FadeInAnimation(
//               delay: 1,
//               child: Row(
//                 children: [
//                   const Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Tue, 2 Jan",
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       Text(
//                         "My Day",
//                         style: TextStyle(fontSize: 34),
//                       ),
//                     ],
//                   ),
//                   const Spacer(),
//                   GestureDetector(
//                     onLongPress: () {
//                       log('triggered');
//                       setState(() {});
//                     },
//                     onTap: () {
//                       // Navigator.push(
//                       //   context,
//                       //   CupertinoPageRoute(
//                       //     builder: (_) => const ProfilePage(),
//                       //   ),
//                       // );
//                     },
//                     child: SizedBox(
//                       height: 70,
//                       width: 70,
//                       child: Hero(
//                         tag: const Key('image'),
//                         child: Container(
//                           decoration: const ShapeDecoration(
//                             shape: StarBorder(
//                               innerRadiusRatio: .9,
//                               pointRounding: .2,
//                               points: 10,
//                             ),
//                             image: DecorationImage(
//                               image: AssetImage('assets/images/model.jpg'),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: w,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       FadeInAnimation(
//                         delay: 1.5,
//                         child: AppCard(
//                           height: 250,
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   const Text(
//                                     "Walk",
//                                     style: TextStyle(fontSize: 18),
//                                   ),
//                                   const Spacer(),
//                                   SizedBox(
//                                     height: 30,
//                                     width: 30,
//                                     child: Image.asset(
//                                       'assets/icons/footprints.png',
//                                       color: Colors.deepPurple,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const Expanded(
//                                 child: ProgressWithText(
//                                   value: 2232,
//                                   indicatorValue: .78,
//                                   title: 'steps',
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       FadeInAnimation(
//                         delay: 2,
//                         child: AppCard(
//                           height: w,
//                           child: const Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Sleep",
//                                     style: TextStyle(fontSize: 18),
//                                   ),
//                                   Spacer(),
//                                   Icon(
//                                     Iconsax.moon,
//                                     color: Colors.deepPurple,
//                                   ),
//                                 ],
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     IncreasingText(
//                                       7.21,
//                                       isSingle: false,
//                                       style: TextStyle(fontSize: 28),
//                                     ),
//                                     Text(
//                                       "hours",
//                                       style: TextStyle(color: Colors.grey),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       FadeInAnimation(
//                         delay: 2.5,
//                         child: AppCard(
//                           height: 250,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   const Text("Water"),
//                                   const Spacer(),
//                                   SizedBox(
//                                     height: 30,
//                                     width: 30,
//                                     child: Image.asset(
//                                       'assets/icons/waterdrop.png',
//                                       color: Colors.deepPurple,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Expanded(
//                                 child: Center(
//                                   child: Image.asset(
//                                     'assets/icons/glass-of-water.png',
//                                     height: 50,
//                                   ),
//                                 ),
//                               ),
//                               const IncreasingText(
//                                 2,
//                                 isSingle: true,
//                                 style: TextStyle(
//                                   fontSize: 32,
//                                 ),
//                               ),
//                               const Text(
//                                 "bottles",
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Spacer(),
//                 SizedBox(
//                   width: w,
//                   child: Column(
//                     children: [
//                       FadeInAnimation(
//                         delay: 1.5,
//                         child: AppCard(
//                           height: 300,
//                           color: Colors.deepPurple,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Row(
//                                 children: [
//                                   Text(
//                                     "Heart",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18,
//                                     ),
//                                   ),
//                                   Spacer(),
//                                   Icon(Iconsax.heart, color: Colors.white),
//                                 ],
//                               ),
//                               Expanded(
//                                 child: Image.asset(
//                                   'assets/images/graph.png',
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               const IncreasingText(
//                                 98,
//                                 isSingle: true,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 40,
//                                   height: .9,
//                                 ),
//                               ),
//                               const Text(
//                                 "bmp",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       FadeInAnimation(
//                         delay: 2,
//                         child: AppCard(
//                           height: 225,
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   const Text(
//                                     "Calories",
//                                     style: TextStyle(fontSize: 18),
//                                   ),
//                                   const Spacer(),
//                                   SizedBox(
//                                     height: 30,
//                                     width: 30,
//                                     child: Image.asset(
//                                       'assets/icons/thunderbolt.png',
//                                       color: Colors.deepPurple,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const Expanded(
//                                 child: ProgressWithText(
//                                   indicatorValue: .78,
//                                   title: 'kcal',
//                                   value: 553,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       const FadeInAnimation(
//                         delay: 2.5,
//                         child: AppCard(
//                           height: 155,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Gym",
//                                     style: TextStyle(fontSize: 18),
//                                   ),
//                                   Spacer(),
//                                   Icon(
//                                     Iconsax.speedometer5,
//                                     color: Colors.deepPurple,
//                                   ),
//                                 ],
//                               ),
//                               Spacer(),
//                               Text(
//                                 "0",
//                                 style: TextStyle(fontSize: 32),
//                               ),
//                               Text(
//                                 "min",
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 50),
//           ],
//         ),
//       ),
//     );
//   }
// }
