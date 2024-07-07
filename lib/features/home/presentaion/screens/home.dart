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
import 'package:svg_flutter/svg_flutter.dart';
import 'package:system_shop/core/colors/colors.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/core/componant/defult_button.dart';
import 'package:system_shop/core/const/const.dart';
import 'package:system_shop/core/database/cache/cache_helper.dart';
import 'package:system_shop/core/shimmer/shimmer_container.dart';
import 'package:system_shop/core/shimmer/shimmer_list_view.dart';
import 'package:system_shop/features/home/data/componant/controller_container.dart';
import 'package:system_shop/features/home/data/componant/get_car.dart';
import 'package:system_shop/features/home/data/model/car_details.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_state.dart';
import 'package:system_shop/features/home/presentaion/screens/accepted_withdraw.dart';
import 'package:system_shop/features/home/presentaion/screens/all_cars.dart';
import 'package:system_shop/features/home/presentaion/screens/all_messages.dart';
import 'package:system_shop/features/home/presentaion/screens/car_details_debit.dart';
import 'package:system_shop/features/home/presentaion/screens/cash_order.dart';
import 'package:system_shop/features/home/presentaion/screens/dashboard_screen.dart';
import 'package:system_shop/features/home/presentaion/screens/debit_order.dart';
import 'package:system_shop/features/home/presentaion/screens/car_details.dart';
import 'package:system_shop/features/home/presentaion/screens/payments_order.dart';
import 'package:system_shop/features/home/presentaion/screens/pending_withdraw.dart';
import 'package:system_shop/features/home/presentaion/screens/profile_page.dart';
import 'package:system_shop/features/login/presentaion/screens/login_screen/login_screen.dart';
import 'package:system_shop/main.dart';

BuildContext context = MyApp.navKey.currentState!.context;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var txtController = TextEditingController();
  Barcode? result;
  bool isScan = false;
  String scanResult = "";
  bool isNoty = false;
  bool isSalesOrder = false;
  bool isDebit = false;
  bool isCredit = false;
  bool isDebitSell = false;
  bool isSales = false;
  bool isCar = false;
  var carIndex;
  QRViewController? controller;
  Future scanBarcode() async {
    String scanResult;
    try {
      scanResult = '';

      scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Back", false, ScanMode.BARCODE);
      // HomePageCubit.get(context).scan(scanResult);
      // if (HomePageCubit.get(context).success == '1')
      // nextPage(context, UserData());
      HomePageCubit.get(context).number.text = scanResult.toString();
      print('===================scanResult====$scanResult');
      print('===================scanResult====$scanResult');
    } on PlatformException {
      scanResult = "Failed to get platform version";
      // nextPage(context, WriteUserNumber());
    }
    if (!mounted) {
      return;
    }
    setState(() {
      this.scanResult = scanResult;
    });
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "assets/images/bell.png",
      "assets/images/shopping-cart-empty-side-view.png",
    ];
    return BlocProvider<HomePageCubit>(
        create: (context) => HomePageCubit()
          ..getUserData()
          ..getAllCashCount()
          ..getMateialData()
          ..getPendingWithdraw()
          ..getAcceptedWithdraw()
          // ..getLatestMessage()
          ..getSettingsData()
          ..getCachInDayCount()
          ..getAllSalesCount()
          // ..getStillDebitCount()
          ..getAllDebitInDayCount()
          ..getAllPaymentInDayCount()
          ..getAllPaymentCount()
          // ..getClientCar()
          ..getAllDebitCount()
          // ..getAllMessage()
          ..getCashOrder()
          ..getPaymentOrder()
          ..getDebitOrder()
          ..gettotalSalesToDayCount()
        // ..getTopSales()
        ,
        child: BlocConsumer<HomePageCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              HomePageCubit cubit = HomePageCubit.get(context);
              cubit.number.text = scanResult.toString();

              return RefreshIndicator(
                  backgroundColor: AppColors.mainColor,
                  onRefresh: () => cubit.loadData(),
                  child: Scaffold(
                    key: scaffoldKey,
                    drawer: Drawer(
                      width: 260.w,
                      child: ListView(
                        padding: EdgeInsets.only(
                            top: 100.h, left: 15.w, right: 15.w),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              defaultText(
                                  txt: cubit.appSettings != null
                                      ? cubit.appSettings!.data!.name
                                      : '',
                                  fontSize: 20.sp),
                              SizedBox(
                                width: 5.w,
                              ),
                              defaultText(txt: 'مرحبا بك', fontSize: 20.sp),
                            ],
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          InkWell(
                            onTap: () {
                              scaffoldKey.currentState!.closeDrawer();
                              nextPage(context, Home());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                defaultText(
                                    txt: 'الصفحة الرئيسية', fontSize: 20.sp),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Colors.grey,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 30.h,
                            color: Colors.grey,
                          ),
                          InkWell(
                            onTap: () {
                              scaffoldKey.currentState!.closeDrawer();
                              setState(() {
                                isSales = false;
                              });
                              nextPage(
                                  context,
                                  BlocProvider.value(
                                      value: cubit, child: DashBoardScreen()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                defaultText(
                                    txt: 'لوحه التحكم', fontSize: 20.sp),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Colors.grey,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 30.h,
                            color: Colors.grey,
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     scaffoldKey.currentState!.closeDrawer();
                          //     setState(() {
                          //       isSales = false;
                          //     });
                          //     nextPage(
                          //         context,
                          //         BlocProvider.value(
                          //             value: cubit, child: AllMessages()));
                          //   },
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       defaultText(txt: 'الاشعارات', fontSize: 20.sp),
                          //       Icon(
                          //         Icons.arrow_forward_ios_sharp,
                          //         color: Colors.grey,
                          //         size: 20,
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // Divider(
                          //   height: 30.h,
                          //   color: Colors.grey,
                          // ),
                          InkWell(
                            onTap: () {
                              scaffoldKey.currentState!.closeDrawer();
                              setState(() {
                                isSales = false;
                              });
                              nextPage(
                                  context,
                                  BlocProvider.value(
                                      value: cubit, child: PaymentsOrder()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                defaultText(
                                    txt: 'سداد الديون', fontSize: 20.sp),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Colors.grey,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 30.h,
                            color: Colors.grey,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isSales = !isSales;
                                isSalesOrder = false;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                defaultText(txt: 'المبيعات', fontSize: 20.sp),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Colors.grey,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                          if (isSales == true)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    scaffoldKey.currentState!.closeDrawer();
                                    setState(() {
                                      isSales = false;
                                    });
                                    nextPage(
                                        context,
                                        BlocProvider.value(
                                            value: cubit, child: CashOrder()));
                                  },
                                  child: defaultText(
                                      txt: 'الطلبات النقدي ', fontSize: 13.sp),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    scaffoldKey.currentState!.closeDrawer();
                                    setState(() {
                                      isSales = false;
                                    });
                                    nextPage(
                                        context,
                                        BlocProvider.value(
                                            value: cubit, child: debitOrder()));
                                  },
                                  child: defaultText(
                                      txt: 'الطلبات بالدين ', fontSize: 13.sp),
                                ),
                              ],
                            ),
                          Divider(
                            height: 30.h,
                            color: Colors.grey,
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     scaffoldKey.currentState!.closeDrawer();
                          //     nextPage(context, AllCars());
                          //   },
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       defaultText(txt: ' السيارات', fontSize: 20.sp),
                          //       Icon(
                          //         Icons.arrow_forward_ios_sharp,
                          //         color: Colors.grey,
                          //         size: 20,
                          //       )
                          //     ],
                          //   ),
                          // ),

                          InkWell(
                            onTap: () {
                              setState(() {
                                isSalesOrder = !isSalesOrder;
                                isSales = false;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                defaultText(
                                    txt: 'طلبات سداد العهده', fontSize: 20.sp),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Colors.grey,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                          if (isSalesOrder == true)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    scaffoldKey.currentState!.closeDrawer();
                                    setState(() {
                                      isSalesOrder = false;
                                    });
                                    nextPage(
                                        context,
                                        BlocProvider.value(
                                            value: cubit,
                                            child: PendingWithDrawPage()));
                                  },
                                  child: defaultText(
                                      txt: 'الطلبات قيد الانتظار ',
                                      fontSize: 13.sp),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    scaffoldKey.currentState!.closeDrawer();
                                    setState(() {
                                      isSalesOrder = false;
                                    });
                                    nextPage(
                                        context,
                                        BlocProvider.value(
                                            value: cubit,
                                            child: AcceptedWithDrawPage()));
                                  },
                                  child: defaultText(
                                      txt: 'الطلبات مقبوله ', fontSize: 13.sp),
                                ),
                              ],
                            ),
                          // Divider(
                          //   height: 30.h,
                          //   color: Colors.grey,
                          // ),
                          // InkWell(
                          //   onTap: () {
                          //     scaffoldKey.currentState!.closeDrawer();
                          //     nextPage(context, AllCars());
                          //   },
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       defaultText(txt: ' السيارات', fontSize: 20.sp),
                          //       Icon(
                          //         Icons.arrow_forward_ios_sharp,
                          //         color: Colors.grey,
                          //         size: 20,
                          //       )
                          //     ],
                          //   ),
                          // ),

                          Divider(
                            height: 30.h,
                            color: Colors.grey,
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     scaffoldKey.currentState!.closeDrawer();
                          //     nextPage(
                          //         context,
                          //         BlocProvider.value(
                          //             value: cubit, child: ProfilePage()));
                          //   },
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       defaultText(
                          //           txt: 'تعديل الملف الشخصي ',
                          //           fontSize: 20.sp),
                          //       Icon(
                          //         Icons.arrow_forward_ios_sharp,
                          //         color: Colors.grey,
                          //         size: 20,
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // Divider(
                          //   height: 30.h,
                          //   color: Colors.grey,
                          // ),
                          InkWell(
                            onTap: () {
                              scaffoldKey.currentState!.closeDrawer();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: defaultText(
                                      txt: 'تم تسجيل الخروج بنجاح',
                                      fontSize: 20.sp),
                                ),
                              );
                              CacheHelper.removeShared(key: AppConst.kLogin)
                                  .then((value) =>
                                      nextPageUntil(context, LoginScreen()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                defaultText(
                                    txt: 'تسجيل الخروج', fontSize: 20.sp),
                                Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Colors.grey,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    body:
                        // cubit.userData == null
                        //     ? Center(
                        //         child: CircularProgressIndicator(
                        //         color: AppColors.buttonRedColor,
                        //       ))
                        //     :
                        Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                              top: 50.h,
                              left: 15,
                              right: 15,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                scaffoldKey.currentState!
                                                    .openDrawer();
                                              },
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.grey.shade200,
                                                maxRadius: 17,
                                                child: Icon(
                                                  CupertinoIcons
                                                      .text_justifyleft,
                                                  color: Colors.black,
                                                  size: 17,
                                                ),
                                              )),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          // InkWell(
                                          //     onTap: () {
                                          //       setState(() {
                                          //         isNoty = true;
                                          //       });
                                          //       // scanBarcode();
                                          //     },
                                          //     child: Image.asset(
                                          //       'assets/images/notification-bell.png',
                                          //       height: 30.h,
                                          //       width: 30.w,
                                          //     )),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              defaultText(
                                                  txt: ' اهلا بك ',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                              defaultText(
                                                  txt: ' (موظف)',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ],
                                          ),
                                          defaultText(
                                              txt: cubit.userData?.name ?? ' ',
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold)
                                        ],
                                      ),

                                      Container(
                                        height: 35.h,
                                        width: 35.w,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(width: .2),
                                            image:
                                                // cubit.userData!
                                                //             .image !=
                                                //         ""
                                                //     ? DecorationImage(
                                                //         fit: BoxFit
                                                //             .cover,
                                                //         image: NetworkImage(cubit
                                                //             .userData!
                                                //             .image
                                                //             .toString()))
                                                //     :
                                                DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/man.png'))),
                                      ),
                                      // SizedBox(
                                      //   width: 100.w,
                                      // ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isNoty = true;
                                                });
                                              },
                                              child: Container(
                                                width: 270.w,
                                                padding: EdgeInsets.only(
                                                    top: 12, bottom: 12),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    color: AppColors
                                                        .buttonGreenColor),
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          defaultText(
                                                            txt: 'بيع نقدي',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .monetization_on,
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      ),
                                                      // defaultText(
                                                      //   txt: cubit.totalSalesInDay
                                                      //       .toString(),
                                                      //   color: Colors.white,
                                                      //   fontSize: 30.sp,
                                                      //   fontWeight: FontWeight.bold,
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isDebit = true;
                                                });
                                              },
                                              child: Container(
                                                width: 270.w,
                                                padding: EdgeInsets.only(
                                                    top: 12, bottom: 12),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    color: AppColors
                                                        .buttonRedColor),
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          defaultText(
                                                            txt: 'بيع بالدين',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .monetization_on,
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      ),
                                                      // defaultText(
                                                      //   txt: cubit.totalSalesInDay
                                                      //       .toString(),
                                                      //   color: Colors.white,
                                                      //   fontSize: 30.sp,
                                                      //   fontWeight: FontWeight.bold,
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isCredit = true;
                                                });
                                              },
                                              child: Container(
                                                width: 270.w,
                                                padding: EdgeInsets.only(
                                                    top: 12, bottom: 12),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    color: Colors.orangeAccent),
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          defaultText(
                                                            txt: 'تسليم عهده',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .monetization_on,
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      ),
                                                      // defaultText(
                                                      //   txt: cubit.totalSalesInDay
                                                      //       .toString(),
                                                      //   color: Colors.white,
                                                      //   fontSize: 30.sp,
                                                      //   fontWeight: FontWeight.bold,
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isDebitSell = true;
                                                });
                                              },
                                              child: Container(
                                                width: 270.w,
                                                padding: EdgeInsets.only(
                                                    top: 12, bottom: 12),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                    color: AppColors
                                                        .buttonblueColor),
                                                child: Center(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          defaultText(
                                                            txt: 'سداد دين',
                                                            color: Colors.white,
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .monetization_on,
                                                            color: Colors.white,
                                                          ),
                                                        ],
                                                      ),
                                                      // defaultText(
                                                      //   txt: cubit.totalSalesInDay
                                                      //       .toString(),
                                                      //   color: Colors.white,
                                                      //   fontSize: 30.sp,
                                                      //   fontWeight: FontWeight.bold,
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),

                                      Divider(
                                        height: 30.h,
                                        thickness: 6,
                                        color: Colors.grey.shade400,
                                      ),
                                      defaultText(
                                          txt: 'الاحصائيات',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     Row(
                                      //       children: [
                                      //         Icon(Icons.construction_outlined),
                                      //         SizedBox(
                                      //           width: 10.w,
                                      //         ),
                                      //         defaultText(
                                      //             txt: 'لوحة التحكم',
                                      //             fontSize: 17.sp,
                                      //             fontWeight: FontWeight.bold),
                                      //       ],
                                      //     ),
                                      //     InkWell(
                                      //         onTap: () {
                                      //           pop(context);
                                      //         },
                                      //         child: Icon(Icons.arrow_forward))
                                      //   ],
                                      // ),
                                      // SizedBox(
                                      //   height: 60.h,
                                      // ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: 170.w,
                                              padding: EdgeInsets.only(top: 12),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  color: AppColors
                                                      .buttonGreenColor),
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    defaultText(
                                                      txt:
                                                          'اجمالي المعاملات اليوم',
                                                      color: Colors.white,
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    defaultText(
                                                      txt: cubit.totalSalesInDay
                                                          .toStringAsFixed(2),
                                                      color: Colors.white,
                                                      fontSize: 30.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 170.w,
                                              padding: EdgeInsets.only(top: 12),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  color: Colors.orangeAccent),
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    defaultText(
                                                      txt:
                                                          'اجمالي مبيعات اليوم نقدي',
                                                      color: Colors.white,
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    defaultText(
                                                      txt: cubit
                                                          .allCashSalesToDay
                                                          .toStringAsFixed(2),
                                                      color: Colors.white,
                                                      fontSize: 30.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ControllerContainer(
                                              title: cubit.totalSaless
                                                  .toStringAsFixed(2),
                                              txt: 'اجمالي المعاملات ',
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Expanded(
                                            child: ControllerContainer(
                                              title: cubit.allCashSales
                                                  .toStringAsFixed(2),
                                              txt: 'اجمالي الأموال النقدية',
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ControllerContainer(
                                              title: cubit.allDebitSales
                                                  .toStringAsFixed(2),
                                              txt: 'اجمالي المبيعات بالدين',
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Expanded(
                                            child: ControllerContainer(
                                              title: cubit.allPayments
                                                  .toStringAsFixed(2),
                                              txt: 'اجمالي تسديد الدين',
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.w,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ControllerContainer(
                                                color:
                                                    AppColors.buttonGreenColor,
                                                title: cubit.userData?.storage
                                                        .toStringAsFixed(2) ??
                                                    ' ',
                                                txt: 'اجمالي الاموال النقديه '),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: 170.w,
                                              padding: EdgeInsets.only(top: 12),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  color: AppColors
                                                      .buttonGreenColor),
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    defaultText(
                                                      txt:
                                                          'اجمالي مبيعات اليوم بالدين',
                                                      color: Colors.white,
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    defaultText(
                                                      txt: cubit
                                                          .allDebitSalesToDay
                                                          .toStringAsFixed(2),
                                                      color: Colors.white,
                                                      fontSize: 30.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 170.w,
                                              padding: EdgeInsets.only(top: 12),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  color: Colors.orangeAccent),
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    defaultText(
                                                      txt:
                                                          'اجمالي تسديد الدين اليوم ',
                                                      color: Colors.white,
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    defaultText(
                                                      txt: cubit
                                                          .allPaymentsToDay
                                                          .toStringAsFixed(2),
                                                      color: Colors.white,
                                                      fontSize: 30.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      // cubit.carData.isEmpty
                                      //     ? Center(
                                      //         child: CircularProgressIndicator())
                                      //     : Container(
                                      //         padding: EdgeInsets.all(12),
                                      //         decoration: BoxDecoration(
                                      //           borderRadius:
                                      //               BorderRadius.circular(12),
                                      //           border: Border.all(
                                      //               color: Colors.white, width: .4),
                                      //         ),
                                      //         child: Column(
                                      //           crossAxisAlignment:
                                      //               CrossAxisAlignment.end,
                                      //           children: [
                                      //             defaultText(txt: 'عرض السيارات'),
                                      //             ListView.separated(
                                      //                 physics:
                                      //                     NeverScrollableScrollPhysics(),
                                      //                 shrinkWrap: true,
                                      //                 itemBuilder: (context,
                                      //                         index) =>
                                      //                     InkWell(
                                      //                       onTap: () {
                                      //                         setState(() {
                                      //                           isCar = true;
                                      //                           carIndex = index;
                                      //                         });
                                      //                       },
                                      //                       child: Container(
                                      //                         padding:
                                      //                             EdgeInsets.all(
                                      //                                 12),
                                      //                         decoration:
                                      //                             BoxDecoration(
                                      //                           borderRadius:
                                      //                               BorderRadius
                                      //                                   .circular(
                                      //                                       15),
                                      //                           color: Colors.white,
                                      //                         ),
                                      //                         child: Column(
                                      //                           children: [
                                      //                             Icon(CupertinoIcons
                                      //                                 .car_detailed),
                                      //                             SizedBox(
                                      //                               width: 20.w,
                                      //                             ),
                                      //                             Row(
                                      //                               mainAxisAlignment:
                                      //                                   MainAxisAlignment
                                      //                                       .spaceAround,
                                      //                               children: [
                                      //                                 defaultText(
                                      //                                     txt:
                                      //                                         'رقم السيارة'),
                                      //                                 defaultText(
                                      //                                     txt: cubit
                                      //                                         .carData[
                                      //                                             index]
                                      //                                         .number
                                      //                                         .toString()),
                                      //                               ],
                                      //                             ),
                                      //                           ],
                                      //                         ),
                                      //                       ),
                                      //                     ),
                                      //                 separatorBuilder:
                                      //                     (context, index) =>
                                      //                         SizedBox(
                                      //                           height: 15,
                                      //                         ),
                                      //                 itemCount:
                                      //                     cubit.carData.length),
                                      //           ],
                                      //         ),
                                      //       )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  )
                                ],
                              ),
                            )),
                        if (isNoty == true)
                          Padding(
                            padding: EdgeInsets.only(
                                top: 90.h, left: 12.w, right: 12.w),
                            child: Container(
                              height: 360.h,
                              width: 320.w,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 3),
                                        color: Colors.grey.shade400,
                                        blurRadius: 3,
                                        spreadRadius: 3)
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 12, right: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            isNoty = false;
                                          });
                                        },
                                        child: defaultText(
                                          txt: 'الغاء',
                                        )),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              scanBarcode();
                                            },
                                            child: Icon(Icons.qr_code_rounded)),
                                        defaultText(
                                          txt: 'بيع نقدي',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 30.h,
                                      color: Colors.grey,
                                    ),
                                    defaultText(
                                        txt: 'ادخل رقم العربية',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    TextField(
                                      controller: cubit.number,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(15),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isNoty = false;
                                        });
                                        cubit.carNumber();
                                        nextPage(
                                            context,
                                            BlocProvider.value(
                                                value: cubit,
                                                child: CarsDetails(
                                                  carId: cubit.number.text,
                                                )));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(12),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: AppColors.buttonRedColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: defaultText(
                                            txt: 'اتمام',
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (isDebit == true)
                          Padding(
                            padding: EdgeInsets.only(
                                top: 90.h, left: 12.w, right: 12.w),
                            child: Container(
                              height: 360.h,
                              width: 320.w,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 3),
                                        color: Colors.grey.shade400,
                                        blurRadius: 3,
                                        spreadRadius: 3)
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 12, right: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            isDebit = false;
                                          });
                                        },
                                        child: defaultText(
                                          txt: 'الغاء',
                                        )),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              scanBarcode();
                                            },
                                            child: Icon(Icons.qr_code_rounded)),
                                        defaultText(
                                          txt: 'بيع بالدين',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 30.h,
                                      color: Colors.grey,
                                    ),
                                    defaultText(
                                        txt: 'ادخل رقم العربية',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    TextField(
                                      controller: cubit.number,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(15),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        cubit.carNumberDebit();
                                        // if (state is CarNumberDebitSucsses) {
                                        //   nextPage(
                                        //       context,
                                        //       BlocProvider.value(
                                        //           value: cubit,
                                        //           child: CarsDetailsDebit(
                                        //             carId: cubit.number.text,
                                        //           )));
                                        // }
                                        setState(() {
                                          isDebit = false;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(12),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: AppColors.buttonRedColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: defaultText(
                                            txt: 'اتمام',
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (isDebitSell == true)
                          Padding(
                            padding: EdgeInsets.only(
                                top: 90.h, left: 12.w, right: 12.w),
                            child:
                                // Container(
                                //   height: 400.h,
                                //   width: 320.w,
                                //   decoration: BoxDecoration(
                                //       boxShadow: [
                                //         BoxShadow(
                                //             offset: Offset(0, 3),
                                //             color: Colors.grey.shade400,
                                //             blurRadius: 3,
                                //             spreadRadius: 3)
                                //       ],
                                //       borderRadius: BorderRadius.circular(12),
                                //       color: Colors.white),
                                //   child: Padding(
                                //     padding: EdgeInsets.only(
                                //         top: 20, left: 12, right: 12),
                                //     child: SingleChildScrollView(
                                //       child: Column(
                                //         crossAxisAlignment: CrossAxisAlignment.end,
                                //         children: [
                                //           InkWell(
                                //               onTap: () {
                                //                 setState(() {
                                //                   isDebitSell = false;
                                //                 });
                                //               },
                                //               child: defaultText(
                                //                 txt: 'الغاء',
                                //               )),
                                //           SizedBox(
                                //             height: 15.h,
                                //           ),
                                //           Row(
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.spaceBetween,
                                //             children: [
                                //               InkWell(
                                //                   onTap: () {
                                //                     scanBarcode();
                                //                   },
                                //                   child:
                                //                       Icon(Icons.qr_code_rounded)),
                                //               defaultText(
                                //                 txt: 'سداد دين',
                                //                 fontSize: 20,
                                //                 fontWeight: FontWeight.bold,
                                //               ),
                                //             ],
                                //           ),
                                //           Divider(
                                //             height: 30.h,
                                //             color: Colors.grey,
                                //           ),
                                //           defaultText(
                                //               txt: ' رقم العربية',
                                //               fontSize: 17,
                                //               fontWeight: FontWeight.bold),
                                //           SizedBox(
                                //             height: 15.h,
                                //           ),
                                //           TextField(
                                //             controller: cubit.number,
                                //             decoration: InputDecoration(
                                //               contentPadding: EdgeInsets.all(15),
                                //               border: OutlineInputBorder(
                                //                 borderRadius:
                                //                     BorderRadius.circular(10),
                                //                 borderSide:
                                //                     BorderSide(color: Colors.grey),
                                //               ),
                                //               focusedBorder: OutlineInputBorder(
                                //                 borderRadius:
                                //                     BorderRadius.circular(10),
                                //                 borderSide:
                                //                     BorderSide(color: Colors.grey),
                                //               ),
                                //               enabledBorder: OutlineInputBorder(
                                //                 borderRadius:
                                //                     BorderRadius.circular(10),
                                //                 borderSide:
                                //                     BorderSide(color: Colors.grey),
                                //               ),
                                //             ),
                                //           ),
                                //           SizedBox(
                                //             height: 15.h,
                                //           ),
                                //           defaultText(
                                //               txt: '  مبلغ السداد',
                                //               fontSize: 17,
                                //               fontWeight: FontWeight.bold),
                                //           SizedBox(
                                //             height: 15.h,
                                //           ),
                                //           TextFormField(
                                //             controller: cubit.amount,
                                //             decoration: InputDecoration(
                                //               contentPadding: EdgeInsets.all(15),
                                //               border: OutlineInputBorder(
                                //                 borderRadius:
                                //                     BorderRadius.circular(10),
                                //                 borderSide:
                                //                     BorderSide(color: Colors.grey),
                                //               ),
                                //               focusedBorder: OutlineInputBorder(
                                //                 borderRadius:
                                //                     BorderRadius.circular(10),
                                //                 borderSide:
                                //                     BorderSide(color: Colors.grey),
                                //               ),
                                //               enabledBorder: OutlineInputBorder(
                                //                 borderRadius:
                                //                     BorderRadius.circular(10),
                                //                 borderSide:
                                //                     BorderSide(color: Colors.grey),
                                //               ),
                                //             ),
                                //           ),
                                //           SizedBox(
                                //             height: 15.h,
                                //           ),
                                //           InkWell(
                                //             onTap: () {
                                //               setState(() {
                                //                 isDebitSell = false;
                                //               });
                                //               cubit.carNumberDebitSell();
                                //             },
                                //             child: Container(
                                //               padding: EdgeInsets.all(12),
                                //               alignment: Alignment.center,
                                //               decoration: BoxDecoration(
                                //                 color: AppColors.buttonRedColor,
                                //                 borderRadius:
                                //                     BorderRadius.circular(10),
                                //               ),
                                //               child: defaultText(
                                //                   txt: 'اتمام',
                                //                   fontSize: 17,
                                //                   color: Colors.white,
                                //                   fontWeight: FontWeight.bold),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Container(
                              height: 300.h,
                              width: 320.w,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 3),
                                        color: Colors.grey.shade400,
                                        blurRadius: 3,
                                        spreadRadius: 3)
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 12, right: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            isDebitSell = false;
                                          });
                                        },
                                        child: defaultText(
                                          txt: 'الغاء',
                                        )),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              scanBarcode();
                                            },
                                            child: Icon(Icons.qr_code_rounded)),
                                        defaultText(
                                          txt: 'سداد دين',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      height: 30.h,
                                      color: Colors.grey,
                                    ),
                                    defaultText(
                                        txt: 'ادخل رقم العربية',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    TextField(
                                      controller: cubit.number,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(15),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        cubit.carNumberDebits();
                                        // if (state is CarNumberDebitSucsses) {
                                        //   nextPage(
                                        //       context,
                                        //       BlocProvider.value(
                                        //           value: cubit,
                                        //           child: CarsDetailsDebit(
                                        //             carId: cubit.number.text,
                                        //           )));
                                        // }
                                        setState(() {
                                          isDebitSell = false;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(12),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: AppColors.buttonRedColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: defaultText(
                                            txt: 'اتمام',
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (isCredit == true)
                          Padding(
                            padding: EdgeInsets.only(
                                top: 90.h, left: 12.w, right: 12.w),
                            child: Container(
                              height: 330.h,
                              width: 320.w,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 3),
                                        color: Colors.grey.shade400,
                                        blurRadius: 3,
                                        spreadRadius: 3)
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 12, right: 12),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              isCredit = false;
                                            });
                                          },
                                          child: defaultText(
                                            txt: 'الغاء',
                                          )),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // InkWell(
                                          //     onTap: () {
                                          //       scanBarcode();
                                          //     },
                                          //     child:
                                          //         Icon(Icons.qr_code_rounded)),
                                          defaultText(
                                            txt: 'تسليم عهده',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 30.h,
                                        color: Colors.grey,
                                      ),
                                      // defaultText(
                                      //     txt: ' رقم العربية',
                                      //     fontSize: 17,
                                      //     fontWeight: FontWeight.bold),
                                      // SizedBox(
                                      //   height: 15.h,
                                      // ),
                                      // TextField(
                                      //   controller: cubit.number,
                                      //   decoration: InputDecoration(
                                      //     contentPadding: EdgeInsets.all(15),
                                      //     border: OutlineInputBorder(
                                      //       borderRadius:
                                      //           BorderRadius.circular(10),
                                      //       borderSide:
                                      //           BorderSide(color: Colors.grey),
                                      //     ),
                                      //     focusedBorder: OutlineInputBorder(
                                      //       borderRadius:
                                      //           BorderRadius.circular(10),
                                      //       borderSide:
                                      //           BorderSide(color: Colors.grey),
                                      //     ),
                                      //     enabledBorder: OutlineInputBorder(
                                      //       borderRadius:
                                      //           BorderRadius.circular(10),
                                      //       borderSide:
                                      //           BorderSide(color: Colors.grey),
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 15.h,
                                      // ),
                                      defaultText(
                                          txt: '  مبلغ العهده',
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      TextFormField(
                                        controller: cubit.amount,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(15),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide:
                                                BorderSide(color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isCredit = false;
                                          });
                                          cubit.carNumberCreditDebit();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(12),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.buttonRedColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: defaultText(
                                              txt: 'اتمام',
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (isCar == true)
                          Padding(
                            padding: EdgeInsets.only(
                                top: 160.h, left: 12.w, right: 12.w),
                            child: Container(
                              height: 260.h,
                              width: 320.w,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 3),
                                        color: Colors.grey.shade400,
                                        blurRadius: 3,
                                        spreadRadius: 3)
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 12, right: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            isCar = false;
                                          });
                                        },
                                        child: defaultText(
                                          txt: 'الغاء',
                                        )),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    GetCar(
                                      image: cubit.carData[carIndex].qr,
                                      carNumber: cubit.carData[carIndex].number,
                                      availabledebit: cubit
                                          .carData[carIndex].maxDebit
                                          .toString(),
                                      debit: cubit.carData[carIndex].maxDebit
                                          .toString(),
                                      debits: cubit.carData[carIndex].maxDebit
                                          .toString(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (isScan == true)
                          Padding(
                            padding: EdgeInsets.only(top: 90.h, left: 12.w),
                            child: Container(
                              height: 160.h,
                              width: 260.w,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 3),
                                        color: Colors.grey.shade400,
                                        blurRadius: 3,
                                        spreadRadius: 3)
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 12, right: 12),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        scanBarcode();
                                        setState(() {
                                          isScan = false;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/scan.png',
                                            height: 20.h,
                                            width: 20.w,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          defaultText(
                                              txt: 'Scan Qr Code',
                                              fontSize: 17,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    defaultText(
                                        txt: 'ــــ او ــــ',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                    defaultText(
                                        txt: 'من الممكن ادخال الرقم ',
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                    InkWell(
                                      onTap: () {
                                        // nextPage(
                                        //     context,
                                        //     BlocProvider.value(
                                        //         value: cubit,
                                        //         child: WriteUserNumber()));
                                        // setState(() {
                                        //   isScan = false;
                                        // });
                                      },
                                      child: defaultText(
                                          txt: 'اضغط هنا',
                                          fontSize: 17,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ));
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
