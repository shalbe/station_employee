import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/features/home/data/componant/get_car.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_state.dart';

class AllCars extends StatefulWidget {
  const AllCars({super.key});

  @override
  State<AllCars> createState() => _AllCarsState();
}

class _AllCarsState extends State<AllCars> {
  bool isCar = false;
  var carIndex;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit(),
      child: BlocConsumer<HomePageCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            HomePageCubit cubit = HomePageCubit.get(context);
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.only(top: 60.h, left: 12.w, right: 12.w),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  pop(context);
                                },
                                child: Icon(Icons.arrow_back)),
                            Text(
                              'السيارات',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      isCar = true;
                                      carIndex = index;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(CupertinoIcons.car_detailed),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            defaultText(txt: 'رقم السيارة'),
                                            defaultText(
                                                txt: cubit.carData[index].number
                                                    .toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 15,
                                ),
                            itemCount: cubit.carData.length),
                      ],
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
                            padding:
                                EdgeInsets.only(top: 20, left: 12, right: 12),
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
