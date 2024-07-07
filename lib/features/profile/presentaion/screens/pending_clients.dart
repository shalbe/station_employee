import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/colors/colors.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/features/profile/presentaion/profile_cubit/profile_cubit.dart';
import 'package:system_shop/features/profile/presentaion/profile_cubit/profile_state.dart';

class PendingClients extends StatelessWidget {
  const PendingClients({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          ProfileCubit cubit = ProfileCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(top: 60.h, left: 12.w, right: 12.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                      Row(
                        children: [
                          defaultText(
                            txt: 'العملاء قيد الانتظار',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Icon(CupertinoIcons.person_2),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  cubit.client.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : Container(
                          height: 550.h,
                          child: ListView.separated(
                              itemBuilder: (context, index) => Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3,
                                            color: Colors.grey.shade200,
                                            offset: Offset(0, 3),
                                          )
                                        ]),
                                    child: Row(
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              height: 80.h,
                                              width: 90.w,
                                              decoration: BoxDecoration(
                                                color: AppColors.containerColor,
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                              ),
                                            ),
                                            Container(
                                              height: 60.h,
                                              width: 70.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  image: cubit.client[index]
                                                              .image !=
                                                          ""
                                                      ? DecorationImage(
                                                          image: NetworkImage(
                                                              cubit
                                                                  .client[index]
                                                                  .image
                                                                  .toString()))
                                                      : DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/man.png'))),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            defaultText(
                                              txt: cubit.client[index].name
                                                  .toString(),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                cubit.activeClient(
                                                    cubit.client[index].id);
                                              },
                                              child: Container(
                                                height: 40.h,
                                                width: 150.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: AppColors
                                                        .buttonGreenColor),
                                                child: Center(
                                                  child: defaultText(
                                                      txt: 'تنشيط',
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 15.h,
                                  ),
                              itemCount: cubit.client.length),
                        )
                ],
              ),
            ),
          );
        });
  }
}
