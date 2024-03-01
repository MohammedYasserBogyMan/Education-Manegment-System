
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/screen/register/cubit/register_cubit.dart';

import '../../shared/color.dart';
import 'helper/business_screen.dart';
import 'helper/signin_individual_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign up",
          style: TextStyle(fontSize: 20.sp, color: AppColors.colorBlack),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              var cubit = RegisterCubit.get(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select account type:",
                    style: TextStyle(
                        fontSize: 20.sp, color: AppColors.colorTitleSecondary),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => cubit.changeState(action: true),
                        child: Container(
                          height: 125.h,
                          width: 170.w,
                          decoration: BoxDecoration(
                              color:  cubit.isIndividual
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

                                  height: 42.h,
                                  width: 42.w
                              ),
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
                              color:cubit.isIndividual == false? AppColors.colorBlueBlack:Colors.white,
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/parents.jpg",
                                  height: 42.h,
                                  width: 42.w
                              ),
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
                  if (cubit.isIndividual) SignInIndividualScreen(),
                  if (cubit.isIndividual == false) BusinessScreen(),
                  SizedBox(height: 8.h),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have an account?",
                          style: TextStyle(
                              fontSize: 15.sp, color: AppColors.colorBlack),
                        ),
                        const SizedBox(width: 5),
                        // Adding space between the texts
                        GestureDetector(
                          onTap: () {},
                          // navigateReplacementTo(context, LogInScreen()),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.colorBlueBlack,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
