import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/colors/colors.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_state.dart';
import 'package:system_shop/features/home/presentaion/screens/car_details.dart';

class AllMessages extends StatelessWidget {
  const AllMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomePageCubit cubit = HomePageCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(top: 50.h, left: 12.w, right: 12.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                        ),
                      ),
                      defaultText(
                          txt: 'كل الرسائل',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  cubit.AllMessage.isEmpty
                      ? Center(
                          child: defaultText(txt: 'لا يوجد رسائل'),
                        )
                      : ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => ListTile(
                                onTap: () {
                                  nextPage(context, CarsDetails());
                                },
                                selectedTileColor: Colors.white,
                                trailing: Container(
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade200,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/image-.png')),
                                  ),
                                ),
                                title: defaultText(
                                    txt: cubit.AllMessage[index].employeeName
                                        .toString(),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                                subtitle: defaultText(
                                    txt: cubit.AllMessage[index].message
                                        .toString(),
                                    fontSize: 12.sp,
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                          separatorBuilder: (context, index) => Divider(
                                height: 30,
                                color: Colors.grey.shade300,
                              ),
                          itemCount: cubit.AllMessage.length),
                ],
              ),
            ),
          );
        });
  }
}
