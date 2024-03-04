// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school/screen/statistics/models/top_student.dart';
import 'package:school/screen/statistics/widgets.dart';
import 'package:school/shared/color.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TopStudentModel> topStudentsData = [
      TopStudentModel(rank: 1, name: 'Mohamed', level: '4th', gpa: 3.6),
      TopStudentModel(rank: 2, name: 'Ahmed', level: '4th', gpa: 3.4),
      TopStudentModel(rank: 3, name: 'Sara', level: '3rd', gpa: 3.8),
      TopStudentModel(rank: 4, name: 'Ali', level: '2nd', gpa: 3.9),
      TopStudentModel(rank: 5, name: 'Fatima', level: '4th', gpa: 3.7),
      TopStudentModel(rank: 6, name: 'Omar', level: '3rd', gpa: 3.5),
      TopStudentModel(rank: 7, name: 'Layla', level: '2nd', gpa: 3.6),
    ];
    return Scaffold(
      backgroundColor: AppColors.colorBackGroundApp,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Statistics',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            const Center(
              child: Text(
                'Monitor and analyze student performance and \n                               engagement',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CustomContainer(
                    height: 200,
                    width: 200,
                    firstIcon: 'assets/icons/statics1.svg',
                    title: 'Grades',
                    topic: 'assets/icons/statics3.svg',
                  ),
                  SizedBox(width: 30),
                  CustomContainer(
                    height: 200,
                    width: 200,
                    firstIcon: 'assets/icons/Cup.svg',
                    title: 'GPA',
                    topic: 'assets/icons/path.svg',
                  ),
                  SizedBox(width: 30),
                  CustomContainer(
                    height: 200,
                    width: 200,
                    firstIcon: 'assets/icons/iconWithChircle.png',
                    title: 'Att..',
                    topic: 'assets/icons/circil.svg',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: Image.asset(
                    'assets/icons/number1reword.png',
                    height: 25,
                    width: 25,
                  ),
                ),
                const SizedBox(width: 15),
                const Text(
                  'Top Students',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 22),
                ),
                const Spacer(),
                Image.asset(
                  'assets/icons/DownDirection.png',
                  height: 25,
                  width: 25,
                ),
              ],
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                itemCount: topStudentsData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: CustomConteiner22(
                      topData: topStudentsData[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
