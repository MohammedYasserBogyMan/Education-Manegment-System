import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school/shared/color.dart';
import 'package:school/shared/nav.dart';

class MusterButton extends StatelessWidget {
  MusterButton({
    required this.title,
    required this.onTap,
    this.width = double.infinity,
    this.isActive = true,
    this.height = 55,
    super.key,
  });

  final String title;
  final int height;
  final void Function()? onTap;
  double? width;
  bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
          height: height.h,
          width: width,
          decoration: BoxDecoration(
            color: isActive ? AppColors.colorBlueBlack : AppColors.colorBorder,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: AppColors.colorWhite, fontSize: 18.sp),
            ),
          )),
    );
  }
}
class RowTypePeer extends StatelessWidget {
  const RowTypePeer({super.key,
    required this.onPressedBuyer,
    required this.onPressedSeller,
    required this.buyer,
    required this.isSeller,
    required this.seller});

  final void Function() onPressedBuyer;
  final void Function() onPressedSeller;
  final bool isSeller;
  final String buyer;
  final String seller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width:170,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColors.colorBorderBack),
          borderRadius: BorderRadius.all(Radius.circular(12.r))),
      padding: EdgeInsetsDirectional.all(5.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: MaterialButton(
              onPressed: onPressedSeller,
              elevation: 0,
              hoverElevation: 0,
              highlightElevation: 0,
              focusElevation: 0,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              height: 60.h,
              color: isSeller == true
                  ? AppColors.colorWhite
                  : Colors.transparent,
              shape: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child: Text(
                seller,
                style: TextStyle(
                  color: isSeller == true
                      ? AppColors.colorBlack
                      : AppColors.colorWhite,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ),
          Expanded(
            child: MaterialButton(
              onPressed: onPressedBuyer,
              elevation: 0,
              hoverElevation: 0,
              highlightElevation: 0,
              focusElevation: 0,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              height: 60.h,
              color: isSeller == false
                  ? AppColors.colorWhite
                  : Colors.transparent,
              shape: OutlineInputBorder(
                borderSide: BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child: Text(
                buyer,
                maxLines: 1,
                style: TextStyle(
                  color: isSeller == false
                      ? AppColors.colorBlack
                      : AppColors.colorWhite,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.title,
    required this.isCheck,
  });

  final bool isCheck;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 20.w,
          height: 20.h,
          decoration: BoxDecoration(
              color: isCheck
                  ? AppColors.colorSecondary2
                  : AppColors.colorgreendark,
              border: isCheck
                  ? Border.all(
                      color: AppColors.colorBlack,
                    )
                  : Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(50.r)),
          child: Center(
            child: Icon(
              Icons.check,
              color: AppColors.colorBlack,
              size: 15.sp,
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          title,
          style: TextStyle(
            color: AppColors.colorBlack,
            fontSize: 15.sp,
          ),
        )
      ],
    );
  }
}

class ImageBusiness extends StatelessWidget {
  ImageBusiness(
      {super.key,
      required this.image,
      required this.isDone,
      required this.onTap,
      required this.title});

  final String image;
  final String title;
  final bool isDone;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.colorTitleSecondary)),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            SvgPicture.asset(
              image,
              semanticsLabel: 'resume',
              height: 22.h,
              width: 16.w,
            ),
            SizedBox(width: 10.w),
            Text(
              title,
              style: TextStyle(
                  color: AppColors.colorTitle,
                  decoration: TextDecoration.underline),
            ),
            const Spacer(),
            if (isDone == false)
              SvgPicture.asset(
                "assets/icons/upload.svg",
                semanticsLabel: 'resume',
                height: 22.h,
                width: 16.w,
              ),
            if (isDone == true)
              Icon(
                Icons.done,
                color: AppColors.colorPrimary,
              )
          ]),
        ),
      ),
    );
  }
}

class MusterButton2 extends StatelessWidget {
  MusterButton2({
    required this.title,
    required this.onTap,
    this.width = double.infinity,
    this.isActive = true,
    super.key,
  });

  final String title;
  final void Function()? onTap;
  double? width;
  bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
          height: 55.h,
          width: width,
          decoration: BoxDecoration(
              color: isActive ? AppColors.colorWhite : AppColors.colorBorder,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.colorPrimary)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: AppColors.colorPrimary, fontSize: 18.sp),
            ),
          )),
    );
  }
}

class MusterButton3 extends StatelessWidget {
  MusterButton3({
    required this.title,
    required this.onTap,
    this.width = double.infinity,
    this.isActive = true,
    required this.color,
    super.key,
  });

  final String title;
  final void Function()? onTap;
  double? width;
  bool isActive;
  Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
          height: 55.h,
          width: width,
          decoration: BoxDecoration(
            color: isActive ? color : AppColors.colorBorder,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: AppColors.colorWhite, fontSize: 18.sp),
            ),
          )),
    );
  }
}

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            navigateBack(context);
          },
      child: Container(
        width: 45.w,
        height: 45.h,
        decoration: BoxDecoration(
            color: AppColors.colorScaffoldBG,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.colorLightBlack, width: .5)),
        child: Icon(
          Icons.arrow_back,
          size: 30,
          color: AppColors.colorBlack,
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool isNumber;
  final TextInputType? inputType;
  final int? maxNumber;
  final int? maxLines;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool isPassword;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final double? width;
  final double? height;
  final String? title;
  final bool isStar;
  final Color? color;
  final int? radius;

  const CustomTextFormField({
    super.key,
    required this.textController,
    this.onChanged,
    required this.validator,
    this.color,
    this.isNumber = false,
    this.readOnly = false,
    this.isStar = true,
    required this.inputType,
    this.maxNumber,
    this.maxLines = 1,
    this.onTap,
    this.inputFormatters,
    this.isPassword = false,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.width,
    this.height,
    this.title,
    this.radius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius!.r)),
        color: color,
      ),

      // margin: const EdgeInsets.symmetric(vertical: 8),
      width: width,
      height: height,
      child: SizedBox(
        width: 290, // كانت double.infinity
        child: TextFormField(
          onChanged: onChanged,
          controller: textController,
          validator: validator,
          readOnly: readOnly ?? false,
          keyboardType: inputType,
          maxLength: maxNumber,
          maxLines: maxLines,
          onTap: onTap,
          style: TextStyle(fontSize: 16.sp, color: AppColors.colorWhite),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: inputType == TextInputType.number ||
                  inputType == TextInputType.phone
              ? [FilteringTextInputFormatter.digitsOnly]
              : inputFormatters,
          obscureText: isPassword ?? false,
          decoration: InputDecoration(
              counterText: '',
              suffixIcon: suffixIcon,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: prefixIcon,
              ),
              prefixIconConstraints:
                  BoxConstraints.loose(const Size.fromWidth(90)),
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14.sp, color: Color(0xff959595)),
              helperStyle: TextStyle(color: Color(0xff7E7E7E)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius!.r)),
                  borderSide: BorderSide(
                    width: 1,
                    color: AppColors.colorError,
                  )),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius!.r)),
                  borderSide: BorderSide(
                    width: 1,
                    color: AppColors.colorBackground,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius!.r)),
                  borderSide: BorderSide(
                    width: 1,
                    color: AppColors.colorBackground,
                  )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius!.r)),
                  borderSide: BorderSide(
                    width: 1,
                    color: AppColors.colorBackground,
                  )),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
        ),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.colorPrimary),
      ),
    );
  }
}

class ConDetiales extends StatelessWidget {
  final String title;
  final String details;
  final IconData? icon;

  const ConDetiales(
      {super.key, required this.title, required this.details, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title
          //'Create by'
          ,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10.sp,
          ),
        ),
        Row(
          children: [
            Icon(
              icon ?? Icons.person,
              size: 10,
              color: Colors.white,
            ),
            Text(
              details,
              // 'Teacher Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
              ),
            ),
          ],
        )
      ],
    );
  }
}
