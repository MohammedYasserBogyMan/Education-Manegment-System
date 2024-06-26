// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school/main.dart';
import 'package:school/screen/register/Screens/tesy.dart';

import '../../../shared/nav.dart';
import '../../shared/color.dart';
import '../../shared/components.dart';
import '../../shared/validator.dart';
// ignore: unused_import
import '../register/register_screen.dart';
import 'cubit/login_cubit.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();

  bool value = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = LoginCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.colorBackGroundApp,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              "Login",
              style: TextStyle(fontSize: 20.sp, color: AppColors.colorWhite),
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/login.png',
                          width: 300.w,
                          height: 200.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "Welcome back to \nSMS",
                            style: TextStyle(
                              fontSize: 35.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .white, // استخدم اللون الأبيض للنص ليكون مرئيًا على الخلفية
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        "Empowering minds,\ninspiring Futures",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: AppColors.colorWhite,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
                    CustomTextFormField(
                      textController: LoginCubit.get(context).phoneController,
                      validator: (email) => Validator.validateAddress(email!),
                      inputType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        IconlyBroken.addUser,
                        color: AppColors.colorGrey,
                      ),
                      hintText: "Enter your student ID or Email",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextFormField(
                      textController:
                          LoginCubit.get(context).passwordController,
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
                        color: AppColors.colorGrey,
                        semanticsLabel: 'lock_icon',
                        height: 22.h,
                        width: 16.w,
                      ),
                      hintText: "Password",
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customCheekBox(),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Remember me on this device',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.colorWhite,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't Have an account?",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColors.colorLightGreen,
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () => navigateTo(
                              context,
                              const Register_Page(),
                            ), // شيلت الصفحه القديمه وحطيت الجديده
                            child: Text(
                              'Register here.',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.colorWhite,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MusterButton(
                      isActive: state is LoginLoadingState ? false : true,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // cubit.userLogin();
                          navigateFinish(context, const MyHomePage());
                        }
                      },
                      title: "Sign in",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Forgot your password? ",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.colorLightGreen,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          //navigateTo(context, ForgotPasswordScreen()),
                          child: Text(
                            "Reset Now.",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColors.colorWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget customCheekBox() {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Checkbox(
        value: value,
        onChanged: (bool? newValue) {
          setState(() {
            value = newValue!;
          });
        },
        side: const BorderSide(style: BorderStyle.none),
        checkColor: Colors.green,
        activeColor: Colors.transparent,
      ),
    );
  }
}
