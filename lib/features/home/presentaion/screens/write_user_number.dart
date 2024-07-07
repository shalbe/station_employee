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
import 'package:system_shop/features/home/presentaion/screens/user_data.dart';

class WriteUserNumber extends StatefulWidget {
  const WriteUserNumber({super.key});

  @override
  State<WriteUserNumber> createState() => _WriteUserNumberState();
}

class _WriteUserNumberState extends State<WriteUserNumber> {
  String? number;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomeState>(listener: (context, state) {
      if (state is ScanByIdSucsses) {
        nextPage(
            context,
            BlocProvider.value(
                value: HomePageCubit.get(context), child: UserData()));
      }
    }, builder: (context, state) {
      HomePageCubit cubit = HomePageCubit.get(context);
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              // alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 300.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.buttonRedColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 80.h, left: 12, right: 12),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            defaultText(
                                txt: 'اكتب الرقم الخاص بالعميل ',
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
                        // defaultText(
                        //     txt: number ?? '',
                        //     color: Colors.white,
                        //     fontSize: 40,
                        //     fontWeight: FontWeight.bold)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 270.h),
                  child: Container(
                    height: 500.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 100.h, left: 12, right: 12),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: cubit.number,
                            onChanged: (value) {
                              setState(() {
                                number = value;
                              });
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
                                        color: AppColors.buttonRedColor,
                                        width: 1)),
                                hintText: 'اكتب الرقم الخاص بالعميل',
                                prefixIcon: Icon(
                                  Icons.edit,
                                  color: AppColors.greyColor,
                                )),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          InkWell(
                            onTap: () {
                              cubit.scanByNumber();
                            },
                            child: Container(
                              height: 45.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.buttonblueColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: defaultText(
                                    txt: 'اكتمال',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
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
