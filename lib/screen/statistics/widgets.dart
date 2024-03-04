import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school/screen/statistics/models/top_student.dart';

class CustomConteiner22 extends StatelessWidget {
  const CustomConteiner22({
    super.key,
    required this.topData,
  });
  final TopStudentModel topData;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 3),
        color: const Color.fromARGB(30, 150, 100, 100),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Text(
              topData.rank.toString(),
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const Spacer(),
            Text(
              topData.name,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const Spacer(),
            Text(
              topData.level,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const Spacer(),
            Text(
              topData.gpa.toString(),
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.firstIcon,
    required this.title,
    this.topic,
    this.topicPNG,
    this.topicTEXT,
  }) : super(key: key);

  final double height, width;
  final String? title, topic, firstIcon, topicPNG, topicTEXT;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 3),
        color: const Color.fromARGB(30, 150, 100, 100),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: SvgPicture.asset(
                    firstIcon!,
                    height: 25,
                    width: 25,
                  ),
                ),
                Text(
                  title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 22),
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.all(4),
                  height: 15,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: const Center(
                    child: Text(
                      'Filters',
                      style: TextStyle(
                        fontSize: 10, // حجم النص
                        color: Colors.black, // لون النص
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            topic!,
            height: 100,
            width: 100,
          )
        ],
      ),
    );
  }
}
