import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/colors/colors.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_state.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (context) => HomePageCubit()..getUserData(),
      child: BlocConsumer<HomePageCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            HomePageCubit cubit = HomePageCubit.get(context);
            if (cubit.userData != null) {
              // cubit.imagetax!.path == cubit.getUserDataModel!.samehTaxAccount;
              // cubit.imageProfile!.path ==
              //     cubit.getUserDataModel!.samehTaxRegisterAccount;
              cubit.name.text = cubit.userData!.name.toString();
              cubit.emailController.text =
                  cubit.userData!.email.toString();
             
            }

            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 70.h, left: 12.w, right: 12.w),
                    child: cubit.userData == null
                        ? Center(child: CircularProgressIndicator())
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.pending_actions_rounded),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      defaultText(
                                          txt: 'الملف الشخصي',
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold),
                                    ],
                                  ),
                                  InkWell(
                                      onTap: () {
                                        pop(context);
                                      },
                                      child: Icon(Icons.arrow_forward))
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                            
                             
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  defaultText(
                                      txt: 'الاسم بالكامل',
                                      fontSize: 14.sp,
                                      // color: Color(0xff8F92A1),
                                      fontWeight: FontWeight.normal),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Container(
                                    height: 45.h,
                                    child: TextFormField(
                                      controller: cubit.name,
                                      // validator: (value) {
                                      //   if (value!.isEmpty) {
                                      //     emailError = 'Phone must be not Empty';
                                      //     return phoneError;
                                      //   } else {
                                      //     return null;
                                      //   }
                                      // },
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
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
                                          contentPadding:
                                              EdgeInsets.only(top: 30),
                                          border: InputBorder.none,
                                          // errorText: phoneError,
                                          // hintText: 'ادخل اسم المنتج',
                                          prefixIcon: Icon(Icons.snooze)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                 
                                 
                                ],
                              ),
                            
                              defaultText(
                                  txt: 'الايميل',
                                  fontSize: 14.sp,
                                  // color: Color(0xff8F92A1),
                                  fontWeight: FontWeight.normal),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                height: 45.h,
                                child: TextFormField(
                                  controller: cubit.emailController,
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     emailError = 'Phone must be not Empty';
                                  //     return phoneError;
                                  //   } else {
                                  //     return null;
                                  //   }
                                  // },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                            color: AppColors.greyColor,
                                            width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                            color: AppColors.mainColor,
                                            width: 1)),
                                    contentPadding: EdgeInsets.only(top: 30),
                                    border: InputBorder.none,
                                    // errorText: phoneError,
                                    // hintText: 'ادخل اسم المورد',
                                    // prefixIcon: Icon(Icons.person_3_outlined)
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              defaultText(
                                  txt: 'كلمه المرور',
                                  fontSize: 14.sp,
                                  // color: Color(0xff8F92A1),
                                  fontWeight: FontWeight.normal),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                height: 45.h,
                                child: TextFormField(
                                  controller: cubit.passwordController,
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     emailError = 'Phone must be not Empty';
                                  //     return phoneError;
                                  //   } else {
                                  //     return null;
                                  //   }
                                  // },
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                            color: AppColors.greyColor,
                                            width: 1)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                            color: AppColors.mainColor,
                                            width: 1)),
                                    contentPadding: EdgeInsets.only(top: 30),
                                    border: InputBorder.none,
                                    // errorText: phoneError,
                                    // hintText: 'ادخل اسم المورد',
                                    // prefixIcon: Icon(Icons.person_3_outlined)
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              InkWell(
                                onTap: () {
                                 
                                },
                                child: Container(
                                    height: 45,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.buttonRedColor),
                                    child: Center(
                                      child: defaultText(
                                        txt: 'تحديث',
                                        fontSize: 17.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
