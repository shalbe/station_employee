import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/colors/colors.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/features/home/data/model/cach_order.dart';
import 'package:system_shop/features/home/data/model/pending_withdrew.dart';

class GetWithDraw extends StatelessWidget {
  pendingData? data;
  GetWithDraw({super.key, this.data});

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
                        txt: 'الحاله',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    defaultText(
                        txt: '  ${data!.status}  ',
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
                        txt: 'المبلغ',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    defaultText(
                        txt: '  ${data!.credit}  ',
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
          ],
        ),
      ),
    );
  }
}
