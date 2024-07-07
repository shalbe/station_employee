import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/colors/colors.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/features/home/data/model/cach_order.dart';

class GetOrders extends StatelessWidget {
  CashOrderData? data;
  GetOrders({super.key, this.data});

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
                        txt: 'تاريخ الطلب',
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
                        txt: 'اجمالي الطلب',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    defaultText(
                        txt: '  ${data!.total}  ',
                        fontSize: 10,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                Row(
                  children: [
                    defaultText(
                        txt: 'الماده',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    defaultText(
                        txt: '  ${data!.type}  ',
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
                        txt: 'سعر اللتر',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    defaultText(
                        txt: '  ${data!.price}  ',
                        fontSize: 10,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                Row(
                  children: [
                    defaultText(
                        txt: 'الفرع',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    defaultText(
                        txt: '  ${data!.brunch}  ',
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
                        txt: 'الموظف',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    defaultText(
                        txt: '  ${data!.employeeName}  ',
                        fontSize: 10,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold),
                  ],
                ),
                Row(
                  children: [
                    defaultText(
                        txt: 'الكميه المطلوبه',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    defaultText(
                        txt: '  ${data!.quantity}  ',
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
                        txt: 'الرساله',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    defaultText(
                        txt: data!.message != null
                            ? '  ${data!.message}  '
                            : ' ----',
                        fontSize: 10,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
