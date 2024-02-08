import 'package:flutter/material.dart';
import 'package:school/shared/color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackGroundApp,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    children: [
    Column( mainAxisAlignment: MainAxisAlignment.center ,
      children: [
        ClipRRect(child: Image.asset('assets/images/user.svg.png', width: 150,height: 150,)),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child:  Text('Student Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold , color: Colors.white)),
        ),
        const Text( '20200157', style: TextStyle(fontSize: 18, color: Colors.white)),
      ],
    ),
      const Spacer(flex: 1) ,
      buildInfo('Gender :', 'Mall'),
    buildInfo('Birth Date :', '15th Aug 2010'),
    buildInfo('Address :', 'Lorem ipsum dolor sit amet'),
    buildInfo('Class Room :', '1A'),
    buildInfo('Date Entry :', '22nd Jul 2008'),
    buildInfo('Status :', 'Active'),
      const Spacer(flex: 2)
    ],
    ),
    ),
    );
  }

  Widget buildInfo(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold , color: Colors.white),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
                subtitle,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),

        ],
      ),
    );
  }
}
