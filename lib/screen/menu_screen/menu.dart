import 'package:flutter/material.dart';
import 'package:school/main.dart';
import 'package:school/screen/profile/profile_screen.dart';

import '../../shared/color.dart';
import 'about_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackGroundApp,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 15),
          children: <Widget>[
            SizedBox(
              height: 300,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 140,
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: const DecoratedBox(
                        decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage('assets/icons/1.png'),
                            )),
                      ),
                    ),
                    const Text(
                      "Dave Albert",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 80,
                      height: 20,
                      child: InkWell(
                        onTap: () {},
                        child: const Text(
                          "View Profile",
                          style: TextStyle(fontSize: 17, color: Colors.white54),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text(
                "Profile",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
            ),
            ListTile(
              title: const Text("Home",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage()));
              },
            ),
            ListTile(
              title: const Text("Settings",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)),
              onTap: () {},
            ),
            const ListTile(
              title: Text("Support",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)),
            ),
            ListTile(
              title: const Text(
                "About",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutScreen()));
              },
            ),
            ListTile(
              title: const Text("Grades",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)),
              onTap: () {},
            ),
            const SizedBox(
              height: 20.0,
            ),
            const SizedBox(
              height: 100.0,
            ),
            ListTile(
              title: const Text("Logout",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)),
              onTap: () {},
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
