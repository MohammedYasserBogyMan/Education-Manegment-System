import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../shared/components.dart';
import '../../../../shared/nav.dart';
import '../../../../shared/toust.dart';
import '../../../shared/color.dart';
import '../../../shared/validator.dart';
import '../cubit/register_cubit.dart';

class SignInIndividualScreen extends StatelessWidget {
  SignInIndividualScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 35.h),
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 120.h,
                      width: 120.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.colorBorder),
                          shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.all(12.h),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.colorImage,
                          child: cubit.imageIndividual == null
                              ? Icon(
                                  Icons.person,
                                  size: 70.r,
                                )
                              : ClipOval(
                                  child: Image.file(
                                    width: double.infinity,
                                    cubit.imageIndividual!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 29.h,
                          width: 29.h,
                          decoration: BoxDecoration(
                              color: AppColors.colorPrimary,
                              border: Border.all(color: AppColors.colorBorder),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.camera_alt,
                            size: 15.r,
                            color: AppColors.colorWhite,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: () => cubit.pickIndividualImage(),
                          child: Text(
                            "Upload profile photo",
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: AppColors.colorPrimary,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35.h),
              CustomTextFormField(
                textController: cubit.fullNameController,
                validator: (name) => Validator.validateName(name!),
                inputType: TextInputType.name,
                prefixIcon: const Icon(IconlyBroken.profile),
                hintText: "Full Name",
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(
                textController: cubit.phoneController,
                validator: (phone) => Validator.validatePhone(phone!),
                inputType: TextInputType.phone,
                prefixIcon: const Icon(IconlyBroken.addUser),
                hintText: "student ID",
                maxNumber: 9,
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(
                textController: cubit.passwordController,
                validator: (password) => Validator.validatePassword(password!),
                inputType: TextInputType.text,
                isPassword: true,
                prefixIcon: const Icon(IconlyBroken.password),
                hintText: "Password",
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(
                textController: cubit.confirmPasswordController,
                validator: (password) => Validator.validateConfirmPassword(
                    password!, cubit.passwordController.text),
                inputType: TextInputType.text,
                isPassword: true,
                prefixIcon: const Icon(IconlyBroken.password),
                hintText: "Confirm Password",
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(
                textController: cubit.mailController,
                validator: (mail) => Validator.validateEmail(mail!),
                inputType: TextInputType.emailAddress,
                isPassword: false,
                prefixIcon: const Icon(IconlyBroken.document),
                hintText: "Email",
              ),
              SizedBox(height: 8.h),
              SizedBox(height: 24.h),
              MusterButton(
                  isActive: state is SendSignInLoadingState ? false : true,
                  title: "Sign up",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (cubit.imageIndividual == null) {
                        ToastWidget(
                                message: "please select image",
                                color: Colors.red.shade300)
                            .showToast(context);
                      } else if (cubit.selectedValue == null) {
                        ToastWidget(
                                message: "please select governorate",
                                color: Colors.red.shade300)
                            .showToast(context);
                      }
                    }
                  }),
            ],
          ),
        );
      },
    );
  }
}
