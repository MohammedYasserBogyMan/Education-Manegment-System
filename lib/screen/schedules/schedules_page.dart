import 'package:flutter/material.dart';
import 'package:school/screen/schedules/widget/build_list_days.dart';
import 'package:school/screen/schedules/widget/build_list_subject.dart';
import 'package:school/shared/color.dart';

import 'models/item_models.dart';

class SchedulesPage extends StatelessWidget {
  SchedulesPage({super.key});

  final List<ItemModels> itemModels = [
    ItemModels(
      color: AppColors.containarColor1,
      titel: 'English',
      sTime: '09:00',
      eTime: '10:30',
      room: 'Room 1',
    ),
    ItemModels(
      color: AppColors.containarColor2,
      titel: 'Math',
      sTime: '10:30',
      eTime: '12:00',
      room: 'Room 3',
    ),
    ItemModels(
      color: AppColors.containarColor3,
      titel: 'Arabic',
      sTime: '12:00',
      eTime: '01:30',
      room: 'Room 2',
    ),
    ItemModels(
      color: AppColors.containarColor4,
      titel: 'Physics',
      sTime: '01:30',
      eTime: '03:00',
      room: 'Room 7',
    ),
    ItemModels(
      color: AppColors.containarColor5,
      titel: 'Geology',
      sTime: '03:00',
      eTime: '04:30',
      room: 'Room 5',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackGroundApp,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Schedule',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildListOfDays(
                  colorBack: AppColors.colorBlueBlack,
                  colorText: Colors.white,
                  titel: 'Mon'),
              buildListOfDays(
                  colorBack: Colors.white,
                  colorText: Colors.black,
                  titel: 'Tue'),
              buildListOfDays(
                  colorBack: Colors.white,
                  colorText: Colors.black,
                  titel: 'Wed'),
              buildListOfDays(
                  colorBack: Colors.white,
                  colorText: Colors.black,
                  titel: 'Thu'),
              buildListOfDays(
                  colorBack: Colors.white,
                  colorText: Colors.black,
                  titel: 'Fri'),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Monday',
            style: TextStyle(fontSize: 44, color: Colors.white),
          ),
          const Text(
            '14 February 2042',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: itemModels.length,
              itemBuilder: (context, index) {
                return BuildListOfSubject(
                  Item: itemModels[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
