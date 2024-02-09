import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school/screen/home_screen/widget.dart';

import '../../shared/color.dart';
import 'cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  final zoomController;

  const HomeScreen({Key? key, this.zoomController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    final cubit=HomeCubit.get(context);
    return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.colorBackGroundApp,
            leading: Padding(
              padding: const EdgeInsets.only(right: 30, top: 5),
              child: InkWell(
                onTap: () => zoomController.toggle(),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey)),
                  child: const Icon(
                    IconlyBroken.category,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            actions: [
              GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/icons/notification_.svg',
                    height: 35.h,
                    width: 35.w,
                  ))
            ],
          ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Good\nmornning",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Spacer(),
                      Image.asset(
                        'assets/images/smila.png',
                        height: 60.h,
                        width: 60.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 80.h,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/profile.png',
                          height: 70.h,
                          width: 70.w,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mahmoud Ahmed',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '20200157',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 2.w,
                        color: AppColors.colorGreyBlack,
                      ),
                      color: AppColors
                          .colorContainer, // You can change the color as needed
                    ),
                    child: CustomPaint(
                      painter: WavePainter(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 2.h),
                            child: SvgPicture.asset(
                              'assets/icons/gpa.svg',
                              width: 40.w,
                              height: 40.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,

                      itemCount: 3, // Adjust the number of items as needed
                      itemBuilder: (context, index) {
                        return details(); // Assuming details() returns a Widget
                      },
                      // Adjust the item extent as needed
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Day Schedule',
                        style: TextStyle(
                          color: AppColors.colorWhite,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            width: 2.w,
                            color: AppColors.colorGreyBlack,
                          ),
                        ),
                        child: Text(
                          'View All',
                          style: TextStyle(
                            color: AppColors.colorWhite,
                            fontSize: 14.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 200.h,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ImageText();
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 5.h);
                        },
                        itemCount: 3),
                  ),
                  const Text(
                    '12 new assignments uploaded',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  overlapped(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 28.0,
                      child: Image.asset('assets/icons/1.png'),
                    ),
                title: const Text('Science', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold ),),
                subtitle: const Text('3 Assignment'),
              ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 230,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.science.length,
                    itemBuilder: (context, index){
                      return AspectRatio(
                        aspectRatio: 1.5,
                        child: Container(
                          height: 250,
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(cubit.science[index]),
                                fit: BoxFit.contain
                            ),
                            color: Colors.purple[100],
                          ),
                        ),
                      );
                    }
                ),
              ),
              const SizedBox(height: 5,),
              ListTile(
                leading: CircleAvatar(
                  radius: 28.0,
                  child: Image.asset('assets/icons/2.png'),
                ),
                title: const Text('Math', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold ),),
                subtitle: const Text('4 Assignment'),
              ),
              const SizedBox(height: 8,),
              SizedBox(
                height: 230,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.math.length,
                    itemBuilder: (context, index){
                      return AspectRatio(
                        aspectRatio: 1.5,
                        child: Container(
                          height: 250,
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(cubit.math[index]),
                                fit: BoxFit.contain
                            ),
                            color: Colors.purple[100],
                          ),
                        ),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:BottomNavigationBar(
        iconSize: 25,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 0.8),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(IconlyBroken.home),
              label: '_'
          ),
          BottomNavigationBarItem(
              icon: Icon(IconlyBroken.search),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(IconlyBroken.search, size: 5,),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(IconlyBroken.notification),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(IconlyBroken.profile),
              label: ''
          )
        ],
        onTap: (index){
          // _incrementTab(index);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[200],
        onPressed:(){  },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  },
);
  }

  Widget overlapped() {
    const overlap = 35.0;
    final items = [
      Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
              child: Image.asset('assets/icons/1.png'),
              backgroundColor: Colors.red
          )
      ),
      Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
              child: Image.asset('assets/icons/2.png'),
              backgroundColor: Colors.green
          )
      ),
      Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
              child: Image.asset('assets/icons/3.png'),
              backgroundColor: Colors.blue
          )
      ),
      Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
              child: Image.asset('assets/icons/6.png'),
              backgroundColor: Colors.blue
          )
      ),
      Container(
          padding: const EdgeInsets.all(2.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
              child: Text('9', style: TextStyle(color: Colors.grey[600], fontSize: 20),),
              backgroundColor: Colors.purple[100]
          )
      ),
    ];

    List<Widget> stackLayers = List<Widget>.generate(items.length, (index) {
      return Padding(
        padding: EdgeInsets.fromLTRB(index.toDouble() * overlap, 0, 0, 0),
        child: items[index],
      );
    });

    return Stack(children: stackLayers);
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height / 2); // Start at the center
    path.quadraticBezierTo(
      size.width / 4,
      size.height / 2 - 20, // Adjust this value for the control point
      size.width / 2,
      size.height / 2, // End at the center
    );
    path.quadraticBezierTo(
      3 * size.width / 4,
      size.height / 2 + 20, // Adjust this value for the control point
      size.width,
      size.height / 2, // End at the center
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}