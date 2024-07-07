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
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ExamsCubit.get(context).getExam();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,

          centerTitle: true,
        ),
        body: BlocConsumer<ExamsCubit, ExamsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final cubit = ExamsCubit.get(context);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Container(
                      height: 200.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.color2E),
                      child:
                        state is ProfileLoadingState||cubit.exameModel.data==null?LoadingWidget():
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
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
                                const Spacer(),
                                const Icon(
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
                              cubit.exameModel.data!.description.toString(),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 8.sp,
                                color: AppColors.colorWhite,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                 ConDetiales(
                                  title: 'Create by',
                                  details: cubit.exameModel.data!.teacherId==16?"MICHALE":"MOHAMED",
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                const ConDetiales(
                                  title: 'Exam Name',
                                  details: 'English',
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                 ConDetiales(
                                  title: 'Duration',
                                  details: cubit.exameModel.data!.updatedAt.toString(),
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
                    prefixIcon: const Icon(IconlyBroken.search),
                    hintText: "Search any exam by name or department",
                    // ignore: body_might_complete_normally_nullable
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
              ),
            );
          },
        ));
  }
}
