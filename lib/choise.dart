import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/screen/login/login_screen.dart';
import 'package:school/screen/register/cubit/register_cubit.dart';
import 'package:school/shared/color.dart';
import 'package:school/shared/components.dart';
import 'package:school/shared/nav.dart';

class ChoiseUser extends StatelessWidget {
  const ChoiseUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png"),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => cubit.changeState(action: true),
                      child: Container(
                        height: 125.h,
                        width: 170.w,
                        decoration: BoxDecoration(
                            color: cubit.isIndividual
                                ? AppColors.colorBlueBlack
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                                color: cubit.isIndividual
                                    ? AppColors.colorSecondary
                                    : AppColors.colorTitleSecondary)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/student.png",
                                height: 42.h, width: 42.w),
                            Text(
                              "student",
                              style: TextStyle(

                                  ///
                                  fontSize: 20.sp,
                                  color: cubit.isIndividual
                                      ? AppColors.colorgreenwhite
                                      : AppColors.colorTitleSecondary),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => cubit.changeState(action: false),
                      child: Container(
                        height: 125.h,
                        width: 170.w,
                        decoration: BoxDecoration(
                            color: cubit.isIndividual == false
                                ? AppColors.colorBlueBlack
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all()),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/parents.jpg",
                                height: 42.h, width: 42.w),
                            Text(
                              "Parents",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: cubit.isIndividual == false
                                      ? AppColors.colorgreenwhite
                                      : AppColors.colorTitleSecondary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: MusterButton(
                      title: cubit.isIndividual == false
                          ? "Login Parents"
                          : "Login student",
                      onTap: () {
                        navigateTo(context, const LogInScreen());
                      }),
                )
              ],
            )),
          );
        },
      ),
    );
  }
}
