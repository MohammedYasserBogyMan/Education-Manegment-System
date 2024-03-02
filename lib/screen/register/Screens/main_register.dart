import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:school/screen/register/Screens/sconed_regester.dart';
import 'package:school/screen/register/cubit/register_cubit.dart';
import 'package:school/shared/color.dart';
import 'package:school/shared/components.dart';
import 'package:school/shared/toust.dart';
import 'package:school/shared/validator.dart';

class FirstRegistarPage extends StatelessWidget {
  FirstRegistarPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return Scaffold(
          body: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Step 1:Email and Password',
                    style: TextStyle(
                        color: AppColors.colorWhite,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Input fieled for entering the enterEmail \nand Password provided b the school',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 55),
                  CustomTextFormField(
                    textController: cubit.businessMailController,
                    validator: (mail) => Validator.validateEmail(mail!),
                    inputType: TextInputType.emailAddress,
                    isPassword: false,
                    prefixIcon: Icon(IconlyBroken.document),
                    hintText: "Email",
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    textController: cubit.businessPasswordController,
                    validator: (password) =>
                        Validator.validatePassword(password!),
                    inputType: TextInputType.text,
                    isPassword: true,
                    prefixIcon: Icon(IconlyBroken.password),
                    hintText: "Password",
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    textController: cubit.businessConfirmPasswordController,
                    validator: (password) => Validator.validateConfirmPassword(
                        password!, cubit.businessPasswordController.text),
                    inputType: TextInputType.text,
                    isPassword: true,
                    prefixIcon: Icon(IconlyBroken.password),
                    hintText: "Confirm Password",
                  ),
                  SizedBox(height: 125),
                  MusterButton(
                      width: 120,
                      isActive: state is SendBusinessSignInLoadingState
                          ? false
                          : true,
                      title: "Next",
                      onTap: () {})
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
