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
import 'package:system_shop/core/shimmer/shimmer_container.dart';
import 'package:system_shop/core/shimmer/shimmer_list_view.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_state.dart';
import 'package:system_shop/features/home/presentaion/screens/user_data.dart';
import 'package:system_shop/features/home/presentaion/screens/write_user_number.dart';
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
  QRViewController? controller;
  Future scanBarcode() async {
    String scanResult;
    try {
      scanResult = '';

      scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Back", false, ScanMode.BARCODE);
      HomePageCubit.get(context).scan(scanResult);
      // if (HomePageCubit.get(context).success == '1')
      // nextPage(context, UserData());

      print('===================scanResult$scanResult');
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

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "assets/images/bell.png",
      "assets/images/shopping-cart-empty-side-view.png",
    ];
    return BlocProvider<HomePageCubit>(
        create: (context) => HomePageCubit()
          ..getUserData()
          ..getTotalShopSales()
          ..getCompanyList()
          ..getTopSales(),
        child:
            BlocConsumer<HomePageCubit, HomeState>(listener: (context, state) {
          if (state is ScanByIdSucsses) {
            nextPage(context, UserData());
          } else if (state is ScanByIdError) {
            setState(() {
              scanResult = '';
            });
            nextPage(context, WriteUserNumber());
          }
        }, builder: (context, state) {
          HomePageCubit cubit = HomePageCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: RefreshIndicator(
                backgroundColor: AppColors.mainColor,
                onRefresh: () => cubit.loadData(),
                child: Scaffold(
                  body: cubit.userData == null
                      ? Center(
                          child: CircularProgressIndicator(
                          color: AppColors.buttonRedColor,
                        ))
                      : Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      'assets/images/Rectangle 225@2x.png'))),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 50.h, left: 15, right: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: 35.h,
                                                      width: 35.w,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              width: .2),
                                                          image: cubit.userData!
                                                                      .image !=
                                                                  ""
                                                              ? DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: NetworkImage(cubit
                                                                      .userData!
                                                                      .image
                                                                      .toString()))
                                                              : DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/images/man.png'))),
                                                    ),
                                                    // SizedBox(
                                                    //   width: 100.w,
                                                    // ),
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            defaultText(
                                                                txt:
                                                                    ' اهلا بك ',
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            defaultText(
                                                                txt: ' (عميل)',
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ],
                                                        ),
                                                        defaultText(
                                                            txt: cubit.userData
                                                                    ?.name ??
                                                                '',
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.bold)
                                                      ],
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        scanBarcode();
                                                      },
                                                      child: Container(
                                                        height: 30.h,
                                                        width: 30.w,
                                                        decoration: BoxDecoration(
                                                            // borderRadius: BorderRadius.circular(12),
                                                            // border: Border.all(width: .2),
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                          'assets/images/qr-code.png',
                                                        ))),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 40.h,
                                                ),

                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: 170.w,
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 12),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        13),
                                                            color: AppColors
                                                                .buttonGreenColor),
                                                        child: Center(
                                                          child: Column(
                                                            children: [
                                                              defaultText(
                                                                txt:
                                                                    'اجمالي المعاملات',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              defaultText(
                                                                txt: cubit.userData ==
                                                                        null
                                                                    ? ""
                                                                    : cubit
                                                                        .userData!
                                                                        .totalBuy!
                                                                        .toStringAsFixed(
                                                                            2),
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 30.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 12),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        13),
                                                            color: AppColors
                                                                .buttonRedColor),
                                                        child: Center(
                                                          child: Column(
                                                            children: [
                                                              defaultText(
                                                                txt:
                                                                    ' المعاملات المستحقة',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              defaultText(
                                                                txt: cubit.userData ==
                                                                        null
                                                                    ? ""
                                                                    : cubit
                                                                        .userData!
                                                                        .totalDue!
                                                                        .toStringAsFixed(
                                                                            2),
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 30.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                // Row(
                                                //   children: [
                                                //     DefultButton(
                                                //       color:
                                                //           AppColors.buttonGreenColor,
                                                //       title: '3000',
                                                //       txt: 'عدد المبيعات',
                                                //       width: 150.w,
                                                //       hieght: 60.h,
                                                //       ontap: () {},
                                                //     ),
                                                //     // SizedBox(
                                                //     //   width: 15.w,
                                                //     // ),
                                                //     // DefultButton(
                                                //     //   color: AppColors.buttonRedColor,
                                                //     //   title: '3000',
                                                //     //   width: 150.w,
                                                //     //   hieght: 60.h,
                                                //     //   ontap: () {},
                                                //     // ),
                                                //   ],
                                                // ),

                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Center(
                                                  child: Container(
                                                    height: 80.h,
                                                    width: 80.w,
                                                    decoration: BoxDecoration(
                                                        // shape: BoxShape.circle,
                                                        // border: Border.all(width: .2),
                                                        //     image: DecorationImage(
                                                        //         image: NetworkImage(
                                                        //   cubit.userData!.qr
                                                        //       .toString(),
                                                        // ))
                                                        ),
                                                    child: SvgPicture.network(
                                                        cubit.userData!.qr
                                                            .toString()),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Center(
                                                  child: defaultText(
                                                      txt:
                                                          cubit.userData == null
                                                              ? ""
                                                              : cubit.userData!
                                                                  .number
                                                                  .toString(),
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                    Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 30.h),
                                          child: Container(
                                            height: 200,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        'assets/images/Graph@2x.png'))),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 400.h, left: 10, right: 10),
                                    child: cubit.salesData.isEmpty
                                        ? Container(
                                            height: 150.h,
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons
                                                      .share_location_sharp),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  defaultText(
                                                      txt:
                                                          'لا توجد مبيعات جديدة',
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.bold)
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 1000,
                                            child: ListView.separated(
                                                padding: EdgeInsets.zero,
                                                itemBuilder:
                                                    (context, index) => Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            Container(
                                                              height: 80,
                                                              width: double
                                                                  .infinity,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(12),
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16),
                                                                  color: AppColors
                                                                      .containerColor),
                                                            ),
                                                            Stack(
                                                              alignment: Alignment
                                                                  .bottomRight,
                                                              children: [
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                0.h,
                                                                            left: 15.w),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                defaultText(txt: cubit.salesData[index].price.toString(), color: Colors.red, fontSize: 14.sp, fontWeight: FontWeight.bold),
                                                                                defaultText(txt: cubit.salesData[index].date.toString(), fontSize: 12.sp, fontWeight: FontWeight.bold)
                                                                              ],
                                                                            ),
                                                                            SizedBox(
                                                                              width: 50.w,
                                                                            ),
                                                                            Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                defaultText(txt: cubit.salesData[index].clientName.toString(), fontSize: 16.sp, fontWeight: FontWeight.bold),
                                                                                defaultText(txt: cubit.salesData[index].companyName.toString(), fontSize: 12.sp, fontWeight: FontWeight.bold)
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Stack(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                50.h,
                                                                            width:
                                                                                50.w,
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(13), color: AppColors.secandColor),
                                                                          ),
                                                                          Image.asset(
                                                                              'assets/images/shopping bag.png')
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                // Padding(
                                                                //   padding: EdgeInsets.only(
                                                                //       left:
                                                                //           30.w,
                                                                //       right:
                                                                //           30.w),
                                                                //   child:
                                                                //       InkWell(
                                                                //     onTap: () {
                                                                //       cubit.addReturnFund(
                                                                //           cubit.salesData[index].id);
                                                                //     },
                                                                //     child: defaultText(
                                                                //         txt:
                                                                //             'استرجاع',
                                                                //         fontSize: 12
                                                                //             .sp,
                                                                //         color: AppColors
                                                                //             .buttonRedColor,
                                                                //         fontWeight:
                                                                //             FontWeight.bold),
                                                                //   ),
                                                                // )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SizedBox(
                                                          height: 12,
                                                        ),
                                                itemCount:
                                                    cubit.salesData.length),
                                          ))
                              ],
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
                                            nextPage(
                                                context,
                                                BlocProvider.value(
                                                    value: cubit,
                                                    child: WriteUserNumber()));
                                            setState(() {
                                              isScan = false;
                                            });
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
                )),
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
