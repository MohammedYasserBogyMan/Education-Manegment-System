import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/color.dart';
import '../../../shared/components.dart';
import '../cubit/exams_cubit.dart';

class AllScreen extends StatelessWidget {
  const AllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: MediaQuery.of(context).size.height * 0.33,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return BlocConsumer<ExamsCubit, ExamsState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                final cubit = ExamsCubit.get(context);
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Container(
                    height: 120.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: cubit.colorListAll[index]),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
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
                                      color: AppColors.colorWhite,
                                      fontSize: 8.sp),
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
                            'Description of Exame name.',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.colorWhite,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Spacer(),
                          Row(
                            children: [
                              ConDetiales(
                                title: 'Create by',
                                details: 'Teacher Name',
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              ConDetiales(
                                title: 'Exam Name',
                                details: 'English',
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              ConDetiales(
                                title: 'Duration',
                                details: '30 minite',
                                icon: FluentIcons.access_time_24_regular,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10.h,
            );
          },
          itemCount: 4),
    );
  }
}
