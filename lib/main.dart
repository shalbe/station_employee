import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/const/const.dart';
import 'package:system_shop/core/database/api/dio_consumer.dart';
import 'package:system_shop/core/database/bloc_observer.dart';
import 'package:system_shop/core/database/cache/cache_helper.dart';
import 'package:system_shop/core/fonts/fonts.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:system_shop/features/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  uid = CacheHelper.getShared(key: AppConst.kLogin) != null
      ? CacheHelper.getShared(key: AppConst.kLogin)
      : null;
  print('===========$uid');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomePageCubit(),
        )
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              navigatorKey: navKey,
              debugShowCheckedModeBanner: false,
              title: 'الجنوبي',
              home: SplashScreen(),
              theme: ThemeData(
                  // backgroundColor: Color(0xffE2E7ED),
                  textSelectionTheme: const TextSelectionThemeData(
                      selectionHandleColor: Colors.transparent,
                      selectionColor: Color.fromARGB(100, 66, 76, 88)),
                  colorScheme: const ColorScheme.light(
                    brightness: Brightness.light,
                    background: Color(0xffE2E7ED),
                    primary: Color(0xffF3F5F7),
                    secondary: Color(0xff142B6F),
                    tertiary: Color(0xff424C58),
                  ),
                  fontFamily: FontFamilies.GE_SS_TWO),
            );
          }),
    );
  }
}
