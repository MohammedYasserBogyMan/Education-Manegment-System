import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/screen/schedules/cubit/schedules_cubit.dart';
import 'package:school/screen/schedules/widget/build_list_days.dart';
// ignore: unused_import
import 'package:school/screen/schedules/widget/build_list_subject.dart';
import 'package:school/shared/color.dart';

class SchedulesPage extends StatelessWidget {
  const SchedulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackGroundApp,
      body: BlocConsumer<SchedulesCubit, SchedulesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = SchedulesCubit.get(context);
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text('My Class Schedules',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              const SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildListOfDays(
                        colorBack: cubit.initialActive == 0
                            ? AppColors.colorBlueBlack
                            : Colors.white,
                        colorText: cubit.initialActive == 0
                            ? Colors.white
                            : Colors.black,
                        titel: 'Mon',
                        onPressed: () {
                          cubit.changeActiveButton(0);
                        }),
                    buildListOfDays(
                        colorBack: cubit.initialActive == 1
                            ? AppColors.colorBlueBlack
                            : Colors.white,
                        colorText: cubit.initialActive == 1
                            ? Colors.white
                            : Colors.black,
                        titel: 'Tue',
                        onPressed: () {
                          cubit.changeActiveButton(1);
                        }),
                    buildListOfDays(
                        colorBack: cubit.initialActive == 2
                            ? AppColors.colorBlueBlack
                            : Colors.white,
                        colorText: cubit.initialActive == 2
                            ? Colors.white
                            : Colors.black,
                        titel: 'Wed',
                        onPressed: () {
                          cubit.changeActiveButton(2);
                        }),
                    buildListOfDays(
                        colorBack: cubit.initialActive == 3
                            ? AppColors.colorBlueBlack
                            : Colors.white,
                        colorText: cubit.initialActive == 3
                            ? Colors.white
                            : Colors.black,
                        titel: 'Thu',
                        onPressed: () {
                          cubit.changeActiveButton(3);
                        }),
                    buildListOfDays(
                        colorBack: cubit.initialActive == 4
                            ? AppColors.colorBlueBlack
                            : Colors.white,
                        colorText: cubit.initialActive == 4
                            ? Colors.white
                            : Colors.black,
                        titel: 'Fri',
                        onPressed: () {
                          cubit.changeActiveButton(4);
                        }),
                  ],
                ),
              ),
              PageStorage(
                  bucket: PageStorageBucket(), child: cubit.isActiveScreen),
            ],
          );
        },
      ),
    );
  }
}
