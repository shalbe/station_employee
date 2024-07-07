import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:system_shop/core/colors/colors.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/core/componant/defult_button.dart';
import 'package:system_shop/core/shimmer/shimmer_container.dart';
import 'package:system_shop/core/shimmer/shimmer_list_view.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_state.dart';
import 'package:system_shop/features/login/presentaion/screens/login_screen/login_screen.dart';
import 'package:system_shop/features/profile/presentaion/profile_cubit/profile_cubit.dart';
import 'package:system_shop/features/profile/presentaion/profile_cubit/profile_state.dart';
import 'package:system_shop/features/profile/presentaion/screens/pending_clients.dart';
import 'package:system_shop/features/profile/presentaion/screens/return_fund_screen.dart';
import 'package:system_shop/main.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var txtController = TextEditingController();
  Barcode? result;
  String scanResult = "";
  QRViewController? controller;
  Future scanBarcode() async {
    String scanResult;
    try {
      scanResult = '';

      scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Back", false, ScanMode.BARCODE);
      // HomeCubit.get(context).deliveredMealStatus(mealId: scanResult);
      // HomeCubit.get(context).getViewMealWaiter(scanResult);
      // if (HomeCubit.get(context).success == '1')
      // nextPage(
      //     context,
      //     ShowMeal(
      //       value: scanResult,
      //     ));

      print('scanResult$scanResult');
    } on PlatformException {
      scanResult = "Failed to get platform version";
    }
    if (!mounted) {
      return;
    }
    setState(() {
      this.scanResult = scanResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "assets/images/bell.png",
      "assets/images/shopping-cart-empty-side-view.png",
    ];
    return BlocProvider(
        create: (context) => ProfileCubit()
        ..getUserData()..getReturnFunds(),
        child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
          if (state is LogoutSucsess) {
            nextPageUntil(context, LoginScreen());
          }
        }, builder: (context, state) {
          ProfileCubit cubit = ProfileCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: RefreshIndicator(
                backgroundColor: AppColors.mainColor,
                onRefresh: () => cubit.getPendingClient(),
                child: Scaffold(
                    body: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/images/Rectangle 225@2x.png'))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60.h, left: 13, right: 13),
                      child: Column(
                        children: [
                          cubit.userData == null
                              ? SizedBox()
                              : Row(
                                  children: [
                                    Container(
                                      height: 70.h,
                                      width: 70.w,
                                      decoration: BoxDecoration(
                                          image: cubit.userData!.image == ''
                                              ? DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/man.png'),
                                                )
                                              : DecorationImage(
                                                  image: NetworkImage(cubit
                                                      .userData!.image
                                                      .toString())),
                                          shape: BoxShape.circle),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    defaultText(
                                        txt: cubit.userData!.name ?? "",
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold)
                                  ],
                                ),

                          SizedBox(
                            height: 80.h,
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     nextPage(
                          //         context,
                          //         BlocProvider.value(
                          //             value: cubit, child: PendingClients()));
                          //   },
                          //   child: Container(
                          //     height: 70,
                          //     width: double.infinity,
                          //     padding: EdgeInsets.all(12),
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(16),
                          //         color: AppColors.buttonGreenColor),
                          //     child: Row(
                          //       children: [
                          //         Icon(
                          //           CupertinoIcons.person_2,
                          //           color: Colors.white,
                          //         ),
                          //         SizedBox(
                          //           width: 40.w,
                          //         ),
                          //         defaultText(
                          //             txt: 'العملاء قيد الانتظار',
                          //             fontSize: 17.sp,
                          //             fontWeight: FontWeight.bold,
                          //             color: Colors.white),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          InkWell(
                            onTap: () {
                              nextPage(
                                  context,
                                  BlocProvider.value(
                                      value: cubit, child: ReturnFundScreen()));
                            },
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColors.buttonGreenColor),
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.person_2,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 40.w,
                                  ),
                                  defaultText(
                                      txt: 'مرتجعات',
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 30.h,
                          ),
                          InkWell(
                            onTap: () {
                              cubit.logout();
                            },
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColors.buttonGreenColor),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 40.w,
                                  ),
                                  defaultText(
                                      txt: 'تسجيل الخروج',
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))),
          );
        }));
  }
}

class ConvexClipPath extends CustomClipper<Path> {
  double factor = 55;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - size.height * (factor / 100));
    path.quadraticBezierTo(
        size.width / 2,
        size.height - size.height * ((factor - 10) / 100),
        size.width,
        size.height - size.height * (factor / 100));
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
