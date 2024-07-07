import 'package:flutter/material.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/core/const/const.dart';
import 'package:system_shop/features/home_page/presentaion/screens/home_screen.dart';
import 'package:system_shop/features/login/presentaion/screens/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      nextPageUntil(context, uid == null ? LoginScreen() : HomeScreen());
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Image.asset('assets/images/ka1.png')),
    );
  }
}
