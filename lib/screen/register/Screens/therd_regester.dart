import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/main.dart';
import 'package:school/screen/home_/home_screen.dart';
import 'package:school/screen/register/cubit/register_cubit.dart';
import 'package:school/shared/color.dart';
import 'package:school/shared/components.dart';
import 'package:school/shared/toust.dart';
import 'package:school/shared/validator.dart';

class TherdRegesterPage extends StatelessWidget {
  TherdRegesterPage({Key? key});

  final _formKey = GlobalKey<FormState>();

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Step 3: Enter Your Full Name',
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
                    textController: cubit.businessNameController,
                    validator: (name) => Validator.validateName(name!),
                    inputType: TextInputType.name,
                    prefixIcon: Icon(Icons.text_snippet_outlined),
                    hintText: "First Name",
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    textController: cubit.businessNameController,
                    validator: (name) => Validator.validateName(name!),
                    inputType: TextInputType.name,
                    prefixIcon: Icon(Icons.text_snippet_outlined),
                    hintText: "Middle Name",
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    textController: cubit.businessNameController,
                    validator: (name) => Validator.validateName(name!),
                    inputType: TextInputType.name,
                    prefixIcon: Icon(Icons.text_snippet_outlined),
                    hintText: "Last Name",
                  ),
                  SizedBox(height: 125),
                  MusterButton(
                    width: 300,
                    title: "Sign up",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
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
