import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:school/screen/register/cubit/register_cubit.dart';
import 'package:school/shared/color.dart';
import 'package:school/shared/components.dart';
import 'package:school/shared/toust.dart';
import 'package:school/shared/validator.dart';

class SconedRegeisterPage extends StatelessWidget {
  SconedRegeisterPage({super.key});
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
                children: [
                  Text(
                    'Step 2: ID and Phone',
                    style: TextStyle(
                        color: AppColors.colorWhite,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Input fieled for entering the enterEmail \nand Password provided b the school',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 55),
                  CustomTextFormField(
                    textController: cubit.businessCRNumberController,
                    validator: (cr) => Validator.validateCRNumber(cr!),
                    inputType: TextInputType.number,
                    isPassword: false,
                    prefixIcon: const Icon(IconlyBroken.addUser),
                    hintText: "student ID",
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    textController: cubit.businessPhoneController,
                    validator: (phone) => Validator.validatePhone(phone!),
                    inputType: TextInputType.phone,
                    prefixIcon: const Icon(IconlyBroken.call),
                    hintText: "Mobile Number",
                    maxNumber: 11,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    textController: cubit.businessPhoneController,
                    validator: (phone) => Validator.validatePhone(phone!),
                    inputType: TextInputType.phone,
                    prefixIcon: const Icon(IconlyBroken.call),
                    hintText: "Mobile Number",
                    maxNumber: 11,
                  ),
                  const SizedBox(height: 125),
                  MusterButton(
                      width: 120,
                      isActive: state is SendBusinessSignInLoadingState
                          ? false
                          : true,
                      title: "Next",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if (cubit.businessLogo == null) {
                            ToastWidget(
                                    message: "please select business Logo",
                                    color: Colors.red.shade300)
                                .showToast(context);
                          } else if (cubit.attachmentCR == null) {
                            ToastWidget(
                                    message: "please select Attachment CR",
                                    color: Colors.red.shade300)
                                .showToast(context);
                          } else if (cubit.attachmentID == null) {
                            ToastWidget(
                                    message: "please select Attachment ID",
                                    color: Colors.red.shade300)
                                .showToast(context);
                          }
                        }
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
