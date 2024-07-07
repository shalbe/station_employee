import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/colors/colors.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/features/login/presentaion/cubit/login_cubit.dart';
import 'package:system_shop/features/login/presentaion/cubit/login_states.dart';
import 'package:system_shop/features/login/presentaion/screens/login_screen/login_screen.dart';
import 'package:system_shop/features/register/presentaion/cubit/register_cubit.dart';
import 'package:system_shop/features/register/presentaion/cubit/register_states.dart';
import 'package:system_shop/main.dart';

BuildContext context = MyApp.navKey.currentState!.context;

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

String? city;
String? shop;

class _RegisterScreenState extends State<RegisterScreen> {
  String emailError = '';

  String nameError = '';

  String companyError = '';

  String phoneError = '';

  String shopNameError = '';

  String passwordError = '';
  bool isCity = false;
  bool isShops = false;

  int? cityId;
  int? shopId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => RegisterCubit()
        ..getCity()
        ..getShops(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message.toString())));
          nextPage(context, LoginScreen());
        }
      }, builder: (context, state) {
        RegisterCubit cubit = RegisterCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.only(top: 60.h, left: 18.w, right: 18.w),
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // defaultText(
                      //     txt: 'مشترياتي',
                      //     fontSize: 20,
                      //     color: Color.fromARGB(98, 15, 14, 14),
                      //     fontWeight: FontWeight.bold),
                      SizedBox(
                        height: 20.h,
                      ),
                      defaultText(
                          txt: 'ابدء',
                          fontSize: 20.sp,
                          color: Color(0xff171717),
                          fontWeight: FontWeight.bold),
                      defaultText(
                          txt: 'قم بإنشاء حساب للمواصلة!',
                          fontSize: 11.sp,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold),

                      SizedBox(
                        height: 30.h,
                      ),
                      InkWell(
                        onTap: () {
                          cubit.uploadImage();
                          // controller.changeImageProduct();
                        },
                        child: Center(
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            // color: currentScheme.tertiary,
                            dashPattern: [6, 3, 4, 3],
                            radius: Radius.circular(12),
                            padding: EdgeInsets.all(6),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              child: cubit.imageSugget == null
                                  ? Container(
                                      height: 80,
                                      width: 90,
                                      // color: currentScheme.background,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.camera_alt_outlined),
                                          // Text(
                                          //   'add image',
                                          //   style: TextStyle(
                                          //     color: currentScheme.tertiary,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      height: 80,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: FileImage(File(cubit
                                                  .imageSugget!.path
                                                  .toString())))),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      defaultText(
                          txt: 'الاسم',
                          fontSize: 14.sp,
                          // color: Color(0xff8F92A1),
                          fontWeight: FontWeight.normal),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        height: 45.h,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(12),
                        //   border: Border.all(width: .1),
                        // ),
                        child: TextFormField(
                          controller: cubit.nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              nameError = 'الاسم لا يجب ان يكون فارغا';
                              return nameError;
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                      color: AppColors.greyColor, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                      color: AppColors.mainColor, width: 1)),
                              contentPadding: EdgeInsets.only(top: 30),
                              border: InputBorder.none,
                              // errorText: nameError,
                              hintText: 'اكتب الاسم',
                              prefixIcon: Icon(CupertinoIcons.person)),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      defaultText(
                          txt: 'البريد الالكتروني',
                          fontSize: 14.sp,
                          // color: Color(0xff8F92A1),
                          fontWeight: FontWeight.normal),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        height: 45.h,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(12),
                        //   border: Border.all(width: .1),
                        // ),
                        child: TextField(
                          controller: cubit.emailController,
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     emailError = 'Email must be not Empty';
                          //     return emailError;
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 30),
                              border: InputBorder.none,
                              // errorText: emailError,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                      color: AppColors.greyColor, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                      color: AppColors.mainColor, width: 1)),
                              hintText: 'اكتب البريد الالكتروني',
                              prefixIcon: Icon(Icons.email)),
                        ),
                      ),

                      SizedBox(
                        height: 10.h,
                      ),

                      defaultText(
                          txt: 'الموبايل',
                          fontSize: 14.sp,
                          // color: Color(0xff8F92A1),
                          fontWeight: FontWeight.normal),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        height: 45.h,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(12),
                        //   border: Border.all(width: .1),
                        // ),
                        child: TextFormField(
                          controller: cubit.phoneController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              emailError = 'الموبايل لا يجب ان يكون فارغا';
                              return phoneError;
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                      color: AppColors.greyColor, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                      color: AppColors.mainColor, width: 1)),
                              contentPadding: EdgeInsets.only(top: 30),
                              border: InputBorder.none,
                              // errorText: phoneError,
                              hintText: 'اكتب الموبايل',
                              prefixIcon: Icon(Icons.phone)),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      defaultText(
                          txt: 'العنوان',
                          fontSize: 14.sp,
                          // color: Color(0xff8F92A1),
                          fontWeight: FontWeight.normal),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        height: 45.h,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(12),
                        //   border: Border.all(width: .1),
                        // ),
                        child: TextFormField(
                          controller: cubit.addressController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              shopNameError = 'العنوان لا يجب ان يكون فارغا';
                              return shopNameError;
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 30),
                              // border: InputBorder.none,
                              // errorText: shopNameError,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                      color: AppColors.greyColor, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(
                                      color: AppColors.mainColor, width: 1)),
                              hintText: 'اكتب العنوان',
                              prefixIcon: Icon(Icons.shop_outlined)),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      defaultText(
                          txt: 'المدينه',
                          fontSize: 14.sp,
                          // color: Color(0xff8F92A1),
                          fontWeight: FontWeight.normal),
                      SizedBox(
                        height: 5.h,
                      ),

                      InkWell(
                        onTap: () {
                          setState(() {
                            FocusManager.instance.primaryFocus!.unfocus();
                            isCity = true;
                            isShops = false;
                          });
                        },
                        child: Container(
                          height: 45.h,
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(width: .2),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.arrow_drop_down),
                              defaultText(
                                txt: city ?? 'اختار المدينه',
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              defaultText(
                                  txt: 'المحل',
                                  fontSize: 14.sp,
                                  // color: Color(0xff8F92A1),
                                  fontWeight: FontWeight.normal),
                              SizedBox(
                                height: 5.h,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              InkWell(
                                onTap: () {
                                  FocusManager.instance.primaryFocus!.unfocus();

                                  setState(() {
                                    isShops = true;
                                    isCity = false;
                                  });
                                },
                                child: Container(
                                  height: 45.h,
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: .2),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.arrow_drop_down),
                                      defaultText(
                                        txt: shop ?? 'اختر المحل',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.sp,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              defaultText(
                                  txt: 'كلمه السر',
                                  fontSize: 14.sp,
                                  // color: Colors.grey.shade500,
                                  fontWeight: FontWeight.normal),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                height: 45.h,
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(12),
                                //   border: Border.all(width: .1),
                                // ),
                                child: TextFormField(
                                  obscureText: true,
                                  controller: cubit.passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      passwordError =
                                          'كلمه السر لا يجب ان يكون فارغا';
                                      return passwordError;
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(top: 30),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: BorderSide(
                                              color: AppColors.greyColor,
                                              width: 1)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: BorderSide(
                                              color: AppColors.mainColor,
                                              width: 1)),
                                      // border: InputBorder.none,
                                      // errorText: passwordError,
                                      hintText: 'اكتب كلمه السر',
                                      prefixIcon: Icon(CupertinoIcons.padlock)),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              state is RegisterLoading
                                  ? Center(
                                      child: CircularProgressIndicator(
                                      color: AppColors.buttonGreenColor,
                                    ))
                                  : InkWell(
                                      onTap: () {
                                        FocusManager.instance.primaryFocus!
                                            .unfocus();
                                        if (city == null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: defaultText(
                                                      txt: 'اختر المدينه')));
                                        } else if (shop == null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: defaultText(
                                                      txt: 'اختر المحل')));
                                        } else {
                                          if (cubit.imageSugget == null) {
                                            cubit.registerWithout(
                                                cityId: cityId, shopId: shopId);
                                          } else {
                                            cubit.register(
                                                cityId: cityId, shopId: shopId);
                                          }
                                        }
                                      },
                                      child: Container(
                                        height: 55.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: AppColors.mainColor),
                                        child: Center(
                                          child: defaultText(
                                              txt: 'تسجيل الحساب',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.sp),
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  defaultText(
                                      txt: '  هل لديك حساب  ',
                                      fontSize: 11.sp,
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.bold),
                                  InkWell(
                                    onTap: () {
                                      nextPage(context, LoginScreen());
                                    },
                                    child: defaultText(
                                        txt: 'تسجيل الدخول',
                                        fontSize: 16.sp,
                                        color: Color(0xff171717),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 80.h,
                              ),
                            ],
                          ),
                          if (isCity == true)
                            cubit.cityList.isEmpty
                                ? SizedBox()
                                : Container(
                                    height: 200.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Colors.white,
                                      border: Border.all(width: .1),
                                    ),
                                    child: ListView.separated(
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  cityId =
                                                      cubit.cityList[index].id;
                                                  city = cubit
                                                      .cityList[index].name;
                                                  isCity = false;
                                                  isShops = false;
                                                });
                                              },
                                              child: Center(
                                                child: defaultText(
                                                    txt: cubit
                                                        .cityList[index].name
                                                        .toString(),
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                              height: 15.h,
                                              child: Divider(
                                                color: Colors.grey.shade300,
                                              ),
                                            ),
                                        itemCount: cubit.cityList.length),
                                  ),
                          if (isShops == true)
                            cubit.shopList.isEmpty
                                ? SizedBox()
                                : Padding(
                                    padding: EdgeInsets.only(top: 80.h),
                                    child: Container(
                                      height: 200.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Colors.white,
                                        border: Border.all(width: .1),
                                      ),
                                      child: ListView.separated(
                                          itemBuilder: (context, index) =>
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    shopId = cubit
                                                        .shopList[index].id;
                                                    shop = cubit
                                                        .shopList[index].name;
                                                    isCity = false;
                                                    isShops = false;
                                                  });
                                                },
                                                child: Center(
                                                  child: defaultText(
                                                      txt: cubit
                                                          .shopList[index].name
                                                          .toString(),
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                                height: 15.h,
                                                child: Divider(
                                                  color: Colors.grey.shade300,
                                                ),
                                              ),
                                          itemCount: cubit.shopList.length),
                                    ),
                                  ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
