import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/features/home_page/presentaion/home_cubit/home_cubit.dart';
import 'package:system_shop/features/home_page/presentaion/home_cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final iconList = <IconData>[
    CupertinoIcons.person,
    CupertinoIcons.money_dollar,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            HomeCubit cubit = HomeCubit.get(context);
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                onPressed: () {
                  cubit.changeIndexHome(0);
                },
                //params
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: AnimatedBottomNavigationBar(
                icons: iconList,
                activeIndex: cubit.indexScreen,
                activeColor: Colors.red,
                gapLocation: GapLocation.center,
                hideAnimationCurve: Curves.bounceInOut,

                notchSmoothness: NotchSmoothness.verySmoothEdge,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
                //other params
              ),
              body: cubit.screen[cubit.indexScreen],
            );
          }),
    );
  }
}
