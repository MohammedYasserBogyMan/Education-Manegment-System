import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school/shared/nav.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () {
              navigateBack(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
// Shadow depth
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Eariler',
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/profile.png',
                          height: 40.h,
                          width: 40.w,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.white),
                            ),
                            Text(
                              maxLines: 2,
                              'fsdfsdfsfsdfsdfsdfsfffffffffffsssfffffffffdfsdfsd',
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.white),
                            ),
                            Text(
                              'sun at 4:26 pm',
                              style: TextStyle(
                                  fontSize: 8.sp, color: Colors.white),
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.more_horiz,
                          size: 18,
                          color: Colors.white,
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10.h,
                    );
                  },
                  itemCount: 15),
            )
          ],
        ),
      ),
    );
  }
}
