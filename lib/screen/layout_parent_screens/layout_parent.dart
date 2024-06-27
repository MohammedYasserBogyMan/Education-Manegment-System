import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/color.dart';
import 'cubit/parent_cubit.dart';

class LayoutParent extends StatelessWidget {
  const LayoutParent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ParentCubit, ParentState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = ParentCubit.get(context);
        return Scaffold(
          body: cubit.screen[cubit.current],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeIndex(index);
            },
            currentIndex: cubit.current,
            iconSize: 20,
            backgroundColor: AppColors.colorBackGroundApp,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.white,
            selectedLabelStyle: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, height: 0.8),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.calendar), label: 'profile'),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          // floatingActionButton: FloatingActionButton(
          //   backgroundColor: Colors.purple[200],
          //   onPressed:(){  },
          //   tooltip: 'Increment',
          //   child: const Icon(Icons.add),
          // ),
        );
      },
    );
  }
}
