import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/color.dart';
import '../../../shared/components.dart';
import '../../../shared/toust.dart';
import '../cubit/parent_cubit.dart';

class CreditCardDetailsScreen extends StatefulWidget {
  CreditCardDetailsScreen({super.key});

  @override
  State<CreditCardDetailsScreen> createState() =>
      _CreditCardDetailsScreenState();
}

class _CreditCardDetailsScreenState extends State<CreditCardDetailsScreen> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ParentCubit, ParentState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit=ParentCubit.get(context);
        return Form(
          key: key,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomAppBarBack(
                    title: 'Payment method',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    'Credit card details',
                    style: TextStyle(
                      color: AppColors.colorWhite,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFormField(
                      inputFormatters: [],
                      hintText: 'Card Holder Name',
                      textController:cubit. HolderNamecontroller,
                      validator: (p0) {},
                      inputType: TextInputType.name),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextFormField(
                      onChanged: (text) {
                        print(text?.split(" "));
                      },
                      inputFormatters: [
                      ],
                      isNumber: true,
                      hintText: 'Card Number',
                      textController: cubit.CardNumbercontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Card Number can't be empty";
                        }
                        if (value.length != 19) {
                          return "Please enter the 16 digits of your card";
                        }
                        return null;
                      },
                      inputType: TextInputType.number),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomTextFormField(
                            onChanged: (value) {
                              print(value);
                            },
                            inputFormatters: [
                            ],
                            hintText: 'MM/YY',
                            textController: cubit.MMcontroller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "MM/YY can't be empty";
                              }
                              if (value.length != 5) {
                                return "Please enter month and year";
                              }
                              return null;
                            },
                            inputType: TextInputType.number),
                      ),
                      SizedBox(
                        width: 15.h,
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          onChanged: (value){
                            cubit.setState();
                          },
                            inputFormatters: [
                            ],
                            hintText: 'CVV',
                            textController: cubit.CVVcontroller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "CVV can't be empty";
                              } else if (value.length < 3) {
                                return "CVV should be at least 3 characters";
                              }
                              return null;
                            },
                            inputType: TextInputType.number),
                      ),
                    ],
                  ),
                  Spacer(),
                  MusterButton(
                    isActive: cubit.CVVcontroller.text.isEmpty ? false : true,
                    title: 'Proceed to pay',
                    onTap:
                        () {
                      ToastWidget(
                          message: "Done",
                          color: Colors.green.shade300)
                          .showToast(context);
                    },
                  ),
                  SizedBox(
                    height: 20.h,
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
