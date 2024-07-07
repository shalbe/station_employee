import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';
import 'package:system_shop/core/componant/componant.dart';

class GetCar extends StatelessWidget {
  String? image;
  String? carNumber;
  String? debit;
  String? debits;
  String? availabledebit;
  GetCar({
    super.key,
    this.image,
    this.carNumber,
    this.debit,
    this.debits,
    this.availabledebit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                defaultText(
                    txt: 'رقم السياره',
                    fontSize: 11.sp,
                    fontWeight: FontWeight.normal),
                SizedBox(
                  width: 5.w,
                ),
                defaultText(
                    txt: carNumber??'',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold),
              ],
            ),
            Row(
              children: [
                defaultText(
                    txt: 'اقصي حد للدين ',
                    fontSize: 11.sp,
                    fontWeight: FontWeight.normal),
                SizedBox(
                  width: 5.w,
                ),
                defaultText(
                    txt: debit??'',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold),
              ],
            )
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
                    txt: 'المتاح للدين ',
                    fontSize: 11.sp,
                    fontWeight: FontWeight.normal),
                SizedBox(
                  width: 5.w,
                ),
                defaultText(
                    txt: availabledebit??'',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold),
              ],
            ),
            Row(
              children: [
                defaultText(
                    txt: ' الدين المتبقي ',
                    fontSize: 11.sp,
                    fontWeight: FontWeight.normal),
                SizedBox(
                  width: 5.w,
                ),
                defaultText(
                    txt: availabledebit??'', fontSize: 10.sp, fontWeight: FontWeight.bold),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        SvgPicture.network(image.toString(), height: 50.h, width: 50.w),
      ],
    );
  }
}
