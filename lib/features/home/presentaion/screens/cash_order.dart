import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/colors/colors.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/features/home/data/componant/get_orders.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_state.dart';

class CashOrder extends StatelessWidget {
  const CashOrder({super.key});

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
                          txt: 'الطلبات النقدية',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  cubit.cashOrder.isEmpty
                      ? Center(
                          child: defaultText(txt: 'لا يوجد طلبات نقدية'),
                        )
                      : ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GetOrders(
                                data: cubit.cashOrder[index],
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 15.h,
                              ),
                          itemCount: cubit.cashOrder.length),
                ],
              ),
            ),
          );
        });
  }
}
