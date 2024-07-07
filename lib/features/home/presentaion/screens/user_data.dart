import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/colors/colors.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/core/componant/defult_button.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_state.dart';
import 'package:url_launcher/url_launcher.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  String? amount;
  bool isCompany = false;
  int? companyId;
  String? companyName;
  bool isPrice = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomePageCubit cubit = HomePageCubit.get(context);
          @override
          final Uri _url =
              Uri.parse(cubit.scanClientById!.data!.location.toString());
          Future<void> _launchUrl() async {
            if (!await launchUrl(_url)) {
              throw 'Could not launch $_url';
            }
          }

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: SingleChildScrollView(
                child: cubit.scanClientById == null
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppColors.buttonGreenColor,
                      ))
                    : Stack(
                        // alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 430.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.buttonRedColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 60.h, left: 12, right: 12),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      defaultText(
                                          txt: 'بيانات المحل',
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      SizedBox(
                                        width: 30.w,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          pop(context);
                                        },
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                defaultText(
                                                    txt: cubit.scanClientById!
                                                            .data!.totalSale!
                                                            .toStringAsFixed(
                                                                2) ??
                                                        '',
                                                    color: Colors.white,
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Icon(
                                                  Icons.money,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                defaultText(
                                                    txt: cubit.scanClientById!
                                                            .data!.name ??
                                                        '',
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                cubit.scanClientById!.data!
                                                            .logo ==
                                                        ''
                                                    ? Image.asset(
                                                        'assets/images/man.png',
                                                        height: 30,
                                                        width: 30,
                                                      )
                                                    : Container(
                                                        height: 30.h,
                                                        width: 30.w,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image: DecorationImage(
                                                                image: NetworkImage(cubit
                                                                    .scanClientById!
                                                                    .data!
                                                                    .logo
                                                                    .toString()))),
                                                      ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                defaultText(
                                                    txt: cubit.scanClientById!
                                                            .data!.cityName ??
                                                        '',
                                                    color: Colors.white,
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Icon(
                                                  Icons.location_pin,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          _launchUrl();
                                        },
                                        child: Container(
                                          height: 40.h,
                                          width: 190.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: AppColors.buttonblueColor),
                                          child: Center(
                                            child: defaultText(
                                                txt: ' الذهاب الي الموقع',
                                                fontSize: 16.sp,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Icon(
                                        CupertinoIcons.location,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isPrice = !isPrice;
                                          });
                                        },
                                        child: Container(
                                          height: 40.h,
                                          width: 190.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: AppColors.buttonblueColor),
                                          child: Center(
                                            child: defaultText(
                                                txt: isPrice == false
                                                    ? 'مرتجع'
                                                    : 'ارسال الاموال',
                                                fontSize: 16.sp,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Icon(
                                        Icons.money_off_csred,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                 
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  defaultText(
                                      txt: isPrice == true
                                          ? 'هل تود ارجاع اموال الي المحل'
                                          : 'هل تود ارسال اموال الي المحل',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ],
                              ),
                            ),
                          ),
                          if (isPrice == false)
                            Padding(
                              padding: EdgeInsets.only(top: 410.h),
                              child: Container(
                                height: 300.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30)),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 30.h, left: 12, right: 12),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          print('company name');
                                          setState(() {
                                            isCompany = true;
                                          });
                                        },
                                        child: Container(
                                          height: 45.h,
                                          padding: EdgeInsets.all(10),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              border: Border.all(width: .3)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              defaultText(
                                                  txt: companyName ??
                                                      'اختر الشركه',
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.bold),
                                              Icon(Icons.arrow_drop_down)
                                            ],
                                          ),
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: cubit.price,
                                                onChanged: (value) {
                                                  setState(() {
                                                    amount = value;
                                                  });
                                                },
                                                decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.only(
                                                        top:
                                                            30), // border: InputBorder.none,
                                                    // errorText: emailError,
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        borderSide: BorderSide(
                                                            color: AppColors
                                                                .greyColor,
                                                            width: 1)),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        borderSide: BorderSide(
                                                            color: AppColors
                                                                .buttonRedColor,
                                                            width: 1)),
                                                    hintText:
                                                        'ادخل القيمه التي تود ارسالها للمحل',
                                                    prefixIcon: Icon(
                                                      Icons.edit,
                                                      color:
                                                          AppColors.greyColor,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 30.h,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  cubit.addNewFund(
                                                    clientId: cubit
                                                        .scanClientById!
                                                        .data!
                                                        .id,
                                                    companyId: companyId,
                                                  );
                                                },
                                                child: Container(
                                                  height: 45.h,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: AppColors
                                                        .buttonblueColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Center(
                                                    child: defaultText(
                                                        txt: 'اكتمال',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          if (isCompany == true)
                                            BlocProvider(
                                              create: (context) =>
                                                  HomePageCubit()
                                                    ..getCompanyList(),
                                              child: BlocConsumer<HomePageCubit,
                                                      HomeState>(
                                                  listener: (context, state) {},
                                                  builder: (context, state) {
                                                    HomePageCubit homecubit =
                                                        HomePageCubit.get(
                                                            context);
                                                    return homecubit
                                                            .companyList.isEmpty
                                                        ? SizedBox()
                                                        : Container(
                                                            height: 200.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          14),
                                                            ),
                                                            child: ListView
                                                                .separated(
                                                                    itemBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  setState(() {
                                                                                    companyId = homecubit.companyList[index].id;
                                                                                    companyName = homecubit.companyList[index].name;
                                                                                    isCompany = false;
                                                                                  });
                                                                                },
                                                                                child: defaultText(txt: homecubit.companyList[index].name),
                                                                              ),
                                                                            ),
                                                                    separatorBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            SizedBox(
                                                                              height: 15,
                                                                              child: Divider(
                                                                                color: Colors.grey.shade200,
                                                                              ),
                                                                            ),
                                                                    itemCount: homecubit
                                                                        .companyList
                                                                        .length),
                                                          );
                                                  }),
                                            )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (isPrice == true)
                            Padding(
                              padding: EdgeInsets.only(top: 410.h),
                              child: AnimatedContainer(
                                duration: Duration(seconds: 2),
                                height: isPrice == true ? 300.h : 0,
                                width: isPrice == true ? double.infinity : 0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30)),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 30.h, left: 12, right: 12),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          print('company name');
                                          setState(() {
                                            isCompany = true;
                                          });
                                        },
                                        child: Container(
                                          height: isPrice == true ? 45.h : 0,
                                          padding: EdgeInsets.all(10),
                                          width: isPrice == true
                                              ? double.infinity
                                              : 0,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              border: Border.all(width: .3)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              defaultText(
                                                  txt: companyName ??
                                                      'اختر الشركه',
                                                  fontSize: isPrice == true
                                                      ? 13.sp
                                                      : 0,
                                                  fontWeight: FontWeight.bold),
                                              Icon(Icons.arrow_drop_down)
                                            ],
                                          ),
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: cubit.price,
                                                onChanged: (value) {
                                                  setState(() {
                                                    amount = value;
                                                  });
                                                },
                                                decoration: InputDecoration(
                                                    contentPadding: EdgeInsets.only(
                                                        top:
                                                            30), // border: InputBorder.none,
                                                    // errorText: emailError,
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        borderSide: BorderSide(
                                                            color: AppColors
                                                                .greyColor,
                                                            width: 1)),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        borderSide: BorderSide(
                                                            color: AppColors
                                                                .buttonRedColor,
                                                            width: 1)),
                                                    hintText:
                                                        'ادخل القيمه التي تود ارسالها للمحل',
                                                    prefixIcon: Icon(
                                                      Icons.edit,
                                                      color:
                                                          AppColors.greyColor,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 30.h,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  cubit.addReturnFund(
                                                    clientId: cubit
                                                        .scanClientById!
                                                        .data!
                                                        .id,
                                                    companyId: companyId,
                                                  );
                                                },
                                                child: Container(
                                                  height: 45.h,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: AppColors
                                                        .buttonblueColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Center(
                                                    child: defaultText(
                                                        txt: 'اكتمال',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          if (isCompany == true)
                                            BlocProvider(
                                              create: (context) =>
                                                  HomePageCubit()
                                                    ..getCompanyList(),
                                              child: BlocConsumer<HomePageCubit,
                                                      HomeState>(
                                                  listener: (context, state) {},
                                                  builder: (context, state) {
                                                    HomePageCubit homecubit =
                                                        HomePageCubit.get(
                                                            context);
                                                    return homecubit
                                                            .companyList.isEmpty
                                                        ? SizedBox()
                                                        : Container(
                                                            height: 200.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          14),
                                                            ),
                                                            child: ListView
                                                                .separated(
                                                                    itemBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  setState(() {
                                                                                    companyId = homecubit.companyList[index].id;
                                                                                    companyName = homecubit.companyList[index].name;
                                                                                    isCompany = false;
                                                                                  });
                                                                                },
                                                                                child: defaultText(txt: homecubit.companyList[index].name),
                                                                              ),
                                                                            ),
                                                                    separatorBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            SizedBox(
                                                                              height: 15,
                                                                              child: Divider(
                                                                                color: Colors.grey.shade200,
                                                                              ),
                                                                            ),
                                                                    itemCount: homecubit
                                                                        .companyList
                                                                        .length),
                                                          );
                                                  }),
                                            )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
              ),
            ),
          );
        });
  }
}
