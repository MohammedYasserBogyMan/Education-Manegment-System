import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school/screen/attendans/statistics_screen.dart';
import 'package:school/screen/home_/cubit/layout_cubit.dart';
import 'package:school/screen/layout_parent_screens/Parent_home_page/payment.dart';
import 'package:school/screen/layout_screen/layout_screen.dart';
import 'package:school/screen/layout_screen/widget.dart';
import 'package:school/screen/schedules/schedules_page.dart';
import 'package:school/screen/statistics/statistics_screen.dart';
import 'package:school/shared/color.dart';

class ParentHomeScreen extends StatelessWidget {
  const ParentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final cubit = HomeCubit.get(context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Good\nmornning",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/smila.png',
                      height: 60.h,
                      width: 60.w,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 80.h,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/profile.png',
                        height: 70.h,
                        width: 70.w,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'MR.Mohammed Yasser',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '20201216',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 2.w,
                      color: AppColors.colorGreyBlack,
                    ),
                    color: AppColors
                        .colorContainer, // You can change the color as needed
                  ),
                  child: CustomPaint(
                    painter: WavePainter(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 2.h),
                          child: SvgPicture.asset(
                            'assets/icons/gpa.svg',
                            width: 40.w,
                            height: 40.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                SizedBox(
                  height: 80.h,
                  child: ImageText11(
                    iconz: const Icon(
                      FontAwesomeIcons.chartColumn,
                      size: 35.0,
                      color: Colors.blue,
                    ),
                    titel: 'Grades',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StatisticsScreen()),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: 80.h,
                  child: ImageText11(
                    iconz: const Icon(
                      FontAwesomeIcons.clipboard,
                      size: 35.0,
                      color: Colors.blue,
                    ),
                    titel: 'Attendans',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AttendancePage()),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: 80.h,
                  child: ImageText11(
                    iconz: const Icon(
                      FontAwesomeIcons.calendar,
                      size: 35.0,
                      color: Colors.blue,
                    ),
                    titel: 'Schedules',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SchedulesPage()),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: 80.h,
                  child: ImageText11(
                    iconz: const Icon(
                      FontAwesomeIcons.creditCard,
                      size: 35.0,
                      color: Colors.blue,
                    ),
                    titel: 'Payment',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Scaffold(body: CreditCardDetailsScreen())),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
