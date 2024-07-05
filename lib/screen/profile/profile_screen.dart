import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/screen/profile/widget/build_info.dart';
import 'package:school/shared/color.dart';

import 'cubit/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit.get(context).getProfile();
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
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit=ProfileCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                        child: Image.asset(
                          'assets/images/image_person.png',
                          width: 100.w,
                          height: 100.h,
                        )),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Student Name',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    const Text('20200157',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ],
                ),
                const Spacer(flex: 1),
                buildInfo('Gender :', 'Male'),
                buildInfo('Birth Date :', '15th Aug 2010'),
                buildInfo('Address :', 'Lorem ipsum dolor sit amet'),
                buildInfo('Class Room :', '1A'),
                buildInfo('Date Entry :', '22nd Jul 2008'),
                buildInfo('Status :', 'Active'),
                const Spacer(flex: 2)
              ],
            ),
          );
        },
      ),
    );
  }
}
