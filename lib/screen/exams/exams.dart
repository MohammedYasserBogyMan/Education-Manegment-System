import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/shared/components.dart';

import '../../shared/color.dart';
import '../schedules/widget/build_list_days.dart';
import 'cubit/exams_cubit.dart';

class ExamsScreen extends StatelessWidget {
  ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Exams',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<ExamsCubit, ExamsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final cubit = ExamsCubit.get(context);
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.color2E),
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
                          Text(
                            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla ',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 8.sp,
                              color: AppColors.colorWhite,
                            ),
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
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextFormField(
                  maxNumber: 11,
                  textController: cubit.SearchController,
                  inputType: TextInputType.text,
                  prefixIcon: Icon(IconlyBroken.search),
                  hintText: "Search any exam by name or department",
                  validator: (String) {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildListOfDays(
                        colorBack: cubit.initialActive == 0
                            ? AppColors.colorBlueBlack
                            : Colors.white,
                        colorText: cubit.initialActive == 0
                            ? Colors.white
                            : Colors.black,
                        titel: 'All',
                        onPressed: () {
                          cubit.changeActiveButton(0);
                        }),
                    SizedBox(
                      width: 10.w,
                    ),
                    buildListOfDays(
                        colorBack: cubit.initialActive == 1
                            ? AppColors.colorBlueBlack
                            : Colors.white,
                        colorText: cubit.initialActive == 1
                            ? Colors.white
                            : Colors.black,
                        titel: 'To do',
                        onPressed: () {
                          cubit.changeActiveButton(1);
                        }),
                    SizedBox(
                      width: 10.w,
                    ),
                    buildListOfDays(
                        colorBack: cubit.initialActive == 2
                            ? AppColors.colorBlueBlack
                            : Colors.white,
                        colorText: cubit.initialActive == 2
                            ? Colors.white
                            : Colors.black,
                        titel: 'Done',
                        onPressed: () {
                          cubit.changeActiveButton(2);
                        }),
                  ],
                ),
                PageStorage(
                    bucket: PageStorageBucket(), child: cubit.isActiveScreen),
              ],
            );
          },
        ));
  }
}
