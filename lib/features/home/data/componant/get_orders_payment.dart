import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/colors/colors.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/features/home/data/model/cach_order.dart';
import 'package:system_shop/features/home/data/model/get_payment_order.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:system_shop/features/home/presentaion/screens/car_details_sales_update.dart';

class GetOrdersPayment extends StatelessWidget {
  PaymentOrderData? data;
  GetOrdersPayment({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: .2),
            color: Colors.white),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    defaultText(
                        txt: 'تاريخ السداد',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    defaultText(
                        txt: '  ${data!.date}  ',
                        fontSize: 11,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                Row(
                  children: [
                    defaultText(
                        txt: 'رقم السياره',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    defaultText(
                        txt: '  ${data!.carNumber}  ',
                        fontSize: 10,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    defaultText(
                        txt: ' المبلغ المسدد',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    defaultText(
                        txt: '  ${data!.amount}  ',
                        fontSize: 10,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                Row(
                  children: [
                    defaultText(
                        txt: 'رقم العميل',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    defaultText(
                        txt: data!.clientNumber ?? '',
                        fontSize: 10,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    defaultText(
                        txt: 'العميل',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    defaultText(
                        txt: '  ${data!.clientName}  ',
                        fontSize: 10,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold),
                  ],
                ),

                InkWell(
                  onTap: () {
                    nextPage(
                        context,
                        BlocProvider.value(
                          value: context.read<HomePageCubit>(),
                          child: CarsDetailsSalesUpdate(
                            id: data!.id,
                            number: data!.carNumber,
                            empName: data!.clientName,
                            amount: data!.amount,
                          ),
                        ));
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(width: .2),
                        color: Colors.white),
                    child: Icon(
                      Icons.edit,
                      size: 18,
                    ),
                  ),
                )
                // Row(
                //   children: [
                //     defaultText(
                //         txt: 'الكميه المطلوبه',
                //         fontSize: 12,
                //         fontWeight: FontWeight.bold),
                //     defaultText(
                //         txt: '  ${data!.quantity}  ',
                //         fontSize: 10,
                //         color: AppColors.textColor,
                //         fontWeight: FontWeight.bold),
                //   ],
                // ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Row(
            //       children: [
            //         defaultText(
            //             txt: 'الرساله',
            //             fontSize: 12,
            //             fontWeight: FontWeight.bold),
            //         defaultText(
            //             txt: data!.message != null
            //                 ? '  ${data!.message}  '
            //                 : ' ----',
            //             fontSize: 10,
            //             color: AppColors.textColor,
            //             fontWeight: FontWeight.bold),
            //       ],
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
