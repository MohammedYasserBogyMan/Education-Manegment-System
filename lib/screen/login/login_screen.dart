
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../../shared/nav.dart';

import '../../shared/color.dart';
import '../../shared/components.dart';
import '../../shared/toust.dart';
import '../../shared/validator.dart';
import '../register/register_screen.dart';
import 'cubit/login_cubit.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Login",
              style: TextStyle(fontSize: 20.sp, color: AppColors.colorBlack),
            ),
          ),
          body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(24.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorBlack),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Welcome back ",
                    style:
                        TextStyle(fontSize: 20.sp, color: AppColors.colorBlack),
                  ),
                  SizedBox(height: 45.h),
                  CustomTextFormField(
                    maxNumber: 11,
                    textController: LoginCubit.get(context).phoneController,
                    validator: (phone) => Validator.validatePhone(phone!),
                    inputType: TextInputType.phone,
                    prefixIcon: Icon(IconlyBroken.addUser),
                    hintText: "student ID",
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    textController: LoginCubit.get(context).passwordController,
                    validator: (password) =>
                        Validator.validatePassword(password!),
                    inputType: TextInputType.visiblePassword,
                    isPassword: LoginCubit.get(context).isPasswordLogin,
                    suffixIcon: IconButton(
                      onPressed: () {
                        LoginCubit.get(context).changePasswordLoginVisible();
                      },
                      icon: Icon(
                        LoginCubit.get(context).isPasswordLogin
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                    prefixIcon: SvgPicture.asset(
                      "assets/icons/Lock_icon.svg",
                      semanticsLabel: 'lock_icon',
                      height: 22.h,
                      width: 16.w,
                    ),
                    hintText: "Password",
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                            //navigateTo(context, ForgotPasswordScreen()),
                        child: Text(
                          "Forgot your password?",
                          style: TextStyle(
                              fontSize: 15.sp, color: AppColors.colorBlack),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 56.h),
                  MusterButton(
                    isActive: state is LoginLoadingState ? false : true,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {

                      }
                    },
                    title: "Login",
                  ),
                  SizedBox(height: 16.h),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an account?",
                          style: TextStyle(
                              fontSize: 15.sp, color: AppColors.colorBlack),
                        ),
                        const SizedBox(width: 5),
                        // Adding space between the texts
                        GestureDetector(
                          onTap: () =>
                              navigateTo(context, const RegisterScreen()),
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.colorBlack,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "By continuing, You agree to our",
                          style: TextStyle(
                              fontSize: 15.sp, color: AppColors.colorBlack),
                        ),
                        const SizedBox(width: 5),
                        // Adding space between the texts
                        GestureDetector(
                          onTap: null,
                          child: Text(
                            'Terms of Service',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.colorPrimary,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "and ",
                        style: TextStyle(
                            fontSize: 15.sp, color: AppColors.colorBlack),
                      ),
                      const SizedBox(width: 5),
                      // Adding space between the texts
                      GestureDetector(
                        onTap: null,
                        child: Text(
                          'Privacy Policy.',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColors.colorPrimary,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
