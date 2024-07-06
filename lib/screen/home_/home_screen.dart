import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school/screen/home_/cubit/layout_cubit.dart';
import '../../shared/color.dart';
import '../layout_screen/layout_screen.dart';
import '../layout_screen/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                  Container(
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
                              'MICHEALE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '19',
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
                    height: 10.h,
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
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,

                      itemCount: 3, // Adjust the number of items as needed
                      itemBuilder: (context, index) {
                        return const details(); // Assuming details() returns a Widget
                      },
                      // Adjust the item extent as needed
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.date_range,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Day Schedule',
                        style: TextStyle(
                          color: AppColors.colorWhite,
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            width: 2.w,
                            color: AppColors.colorGreyBlack,
                          ),
                        ),
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: AppColors.colorWhite,
                            fontSize: 14.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 200.h,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return const ImageText();
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 5.h);
                        },
                        itemCount: 3),
                  ),
                  // const Text(
                  //   '12 new assignments uploaded',
                  //   style: TextStyle(fontSize: 20, color: Colors.grey),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // overlapped(),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // const Divider(
                  //   thickness: 1,
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // ListTile(
                  //   leading: CircleAvatar(
                  //     radius: 28.0,
                  //     child: Image.asset('assets/icons/1.png'),
                  //   ),
                  //   title: Text(
                  //     'Science',
                  //     style: TextStyle(
                  //         fontSize: 19,
                  //         fontWeight: FontWeight.bold,
                  //         color: AppColors.colorWhite),
                  //   ),
                  //   subtitle: Text(
                  //     '3 Assignment',
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: AppColors.colorWhite),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  // SizedBox(
                  //   height: 230,
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: cubit.science.length,
                  //       itemBuilder: (context, index) {
                  //         return AspectRatio(
                  //           aspectRatio: 1.5,
                  //           child: Container(
                  //             height: 250,
                  //             margin: const EdgeInsets.only(right: 15),
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(20),
                  //               image: DecorationImage(
                  //                   image: AssetImage(cubit.science[index]),
                  //                   fit: BoxFit.contain),
                  //               color: Colors.purple[100],
                  //             ),
                  //           ),
                  //         );
                  //       }),
                  // ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // ListTile(
                  //   leading: CircleAvatar(
                  //     radius: 28.0,
                  //     child: Image.asset('assets/icons/2.png'),
                  //   ),
                  //   title: const Text(
                  //     'Math',
                  //     style:
                  //         TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  //   ),
                  //   subtitle: const Text('4 Assignment'),
                  // ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  // SizedBox(
                  //   height: 230,
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: cubit.math.length,
                  //       itemBuilder: (context, index) {
                  //         return AspectRatio(
                  //           aspectRatio: 1.5,
                  //           child: Container(
                  //             height: 250,
                  //             margin: const EdgeInsets.only(right: 15),
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(20),
                  //               image: DecorationImage(
                  //                   image: AssetImage(cubit.math[index]),
                  //                   fit: BoxFit.contain),
                  //               color: Colors.purple[100],
                  //             ),
                  //           ),
                  //         );
                  //       }),
                  // )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
