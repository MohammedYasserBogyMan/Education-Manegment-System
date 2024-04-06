import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/screen/exams/cubit/exams_cubit.dart';
import 'package:school/shared/components.dart';

import '../../shared/color.dart';
import '../schedules/widget/build_list_days.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                RowTypePeer(
                    onPressedBuyer: () {
                      if (cubit.isSeller == false) {
                      } else {
                        cubit.changeSeller();
                      }
                    },
                    onPressedSeller: () {
                      if (cubit.isSeller == true) {
                      } else {
                        cubit.changeSeller();
                      }
                    },
                    buyer: 'Group',
                    isSeller: cubit.isSeller,
                    seller: 'Personal'),
                const SizedBox(
                  height: 40,
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
                      },
                    ),
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
                      },
                    ),
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
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                PageStorage(
                  bucket: PageStorageBucket(),
                  child: cubit.isActiveScreen,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
