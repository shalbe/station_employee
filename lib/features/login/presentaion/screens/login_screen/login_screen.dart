import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/colors/colors.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/features/home_page/presentaion/screens/home_screen.dart';
import 'package:system_shop/features/login/presentaion/cubit/login_cubit.dart';
import 'package:system_shop/features/login/presentaion/cubit/login_states.dart';
import 'package:system_shop/features/register/presentaion/screens/login_screen/register_screen.dart';
import 'package:system_shop/main.dart';

BuildContext context = MyApp.navKey.currentState!.context;

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  String emailError = '';
  String passwordError = '';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
        // if (state is LoginSuccess) {
        //   nextPageUntil(context, HomeScreen());
        // }
      }, builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.only(top: 100.h, left: 18.w, right: 18.w),
              child: SingleChildScrollView(
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
                        txt: 'دعنا نقوم بتسجيل دخولك',
                        fontSize: 23.sp,
                        color: Color(0xff171717),
                        fontWeight: FontWeight.bold),
                    defaultText(
                        txt: 'مرحبًا بك من جديد، لقد افتقدناك!',
                        fontSize: 11.sp,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold),

                    SizedBox(
                      height: 50.h,
                    ),
                    Form(
                      key: cubit.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          defaultText(
                              txt: 'البريد الاليكتروني',
                              fontSize: 14.sp,
                              // color: Color(0xff8F92A1),
                              fontWeight: FontWeight.normal),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFormField(
                            controller: cubit.emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                emailError =
                                    'البريد الالكتروني يجب الا يكون فارغا';
                                return emailError;
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    top: 30), // border: InputBorder.none,
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
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: AppColors.greyColor,
                                )),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          defaultText(
                              txt: 'كلمه السر',
                              fontSize: 14.sp,
                              // color: Colors.grey.shade500,
                              fontWeight: FontWeight.normal),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFormField(
                            obscureText: true,
                            cursorColor: AppColors.greyColor,
                            controller: cubit.passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                passwordError = 'كلمه السر يجب الا تكون فارغا';
                                return passwordError;
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                // border: OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(16),
                                //     borderSide: BorderSide(
                                //         color: AppColors.greyColor, width: 1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                        color: AppColors.greyColor, width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                        color: AppColors.mainColor, width: 1)),
                                contentPadding: EdgeInsets.only(top: 30),
                                // border: InputBorder.none,
                                // errorText: passwordError,
                                hintText: 'اكتب كلمه السر',
                                prefixIcon: Icon(CupertinoIcons.padlock,
                                    color: AppColors.greyColor)),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 50.h,
                    ),
                    state is LoginLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: AppColors.mainColor,
                          ))
                        : InkWell(
                            onTap: () {
                              
                                cubit.login();
                              
                            },
                            child: Container(
                              height: 55.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.mainColor),
                              child: Center(
                                child: defaultText(
                                    txt: 'تسجيل الدخول',
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
                            txt: '  ليس لديك حساب     ',
                            fontSize: 11.sp,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold),
                        InkWell(
                          onTap: () {
                            nextPage(context, RegisterScreen());
                          },
                          child: defaultText(
                              txt: 'تسجيل الحساب',
                              fontSize: 16.sp,
                              color: Color(0xff171717),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
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
