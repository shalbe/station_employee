import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/componant/componant.dart';

class ControllerContainer extends StatelessWidget {
  String? title;
  String? txt;
  double? hieght;
  double? width;
  Color? color;
  ControllerContainer(
      {super.key, this.color, this.hieght, this.width, this.title, this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hieght,
      width: width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: color == null ? Border.all(width: .3) : Border.all(width: .1),
        borderRadius: BorderRadius.circular(13),
        color: color ?? Colors.white,
      ),
      child: Column(
        children: [
          defaultText(
              txt: title,
              color: color == null ? Colors.black : Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold),
          SizedBox(
            height: 5.h,
          ),
          defaultText(
              txt: txt,
              color: color == null ? Colors.black : Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}
