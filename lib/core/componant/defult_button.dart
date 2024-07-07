import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/componant/componant.dart';

class DefultButton extends StatelessWidget {
  double? hieght;
  double? width;
  String? title;
  String? txt;
  Color? color;
  Function()? ontap;
  DefultButton({
    super.key,
    this.color,
    this.txt,
    this.hieght,
    this.ontap,
    this.title,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: hieght ?? 40.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(18)),
        child: Column(
          children: [
            defaultText(
                txt: txt ?? '',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            defaultText(
                txt: title,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ],
        ),
      ),
    );
  }
}
