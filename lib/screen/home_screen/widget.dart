import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/color.dart';

class details extends StatelessWidget {
  const details({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
        height: 150.h,
        width: 120.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.colorSecondary),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 15.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.colorOrange,
                    ),
                    child: Text(
                      'Print',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.colorWhite, fontSize: 8.sp),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.more_vert,
                    size: 18,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Note header\nname Lorem\nipsum .',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.colorWhite,
                ),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit,',
                style: TextStyle(
                  fontSize: 8.sp,
                  color: AppColors.colorWhite,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageText extends StatelessWidget {
  const ImageText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          width: 2.w,
          color: AppColors.colorGreyBlack,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: Row(
          children: [
            Image.asset(
              'assets/images/person.png',
            ),
            SizedBox(
              width: 8.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'lesson Name',
                  style: TextStyle(
                    color: AppColors.colorWhite,
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Text(
                      'Teacher Ahmed Ali',
                      style: TextStyle(
                        color: AppColors.colorWhite,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(
                      width: 160.w,
                    ),
                    Image.asset(
                      'assets/images/Icons.arrow_downward.png',
                      width: 20.w,
                      height: 20.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 15,
                      color: AppColors.colorGreyBlack,
                    ),
                    Text(
                      '11:00 - 09:00 AM',
                      style: TextStyle(
                        color: AppColors.colorGreyBlack,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Icon(
                      Icons.location_on,
                      size: 15,
                      color: AppColors.colorGreyBlack,
                    ),
                    Text(
                      'Room A1.  ',
                      style: TextStyle(
                        color: AppColors.colorGreyBlack,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
