import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/core/const/const.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_state.dart';
import 'package:system_shop/features/home/presentaion/screens/home.dart';
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
      nextPageUntil(context, uid == null ? LoginScreen() : Home());
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit()..getSettingsData(),
      child: BlocConsumer<HomePageCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            HomePageCubit cubit = HomePageCubit.get(context);
            return Container(
              child: cubit.appSettings != null
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: SvgPicture.network(
                          cubit.appSettings!.data!.logo.toString()))
                  : SizedBox(),
            );
          }),
    );
  }
}
