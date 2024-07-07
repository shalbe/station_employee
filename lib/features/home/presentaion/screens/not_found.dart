import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/componant/componant.dart';

class ShopNotFount extends StatelessWidget {
  const ShopNotFount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Icon(CupertinoIcons.person_2),
          SizedBox(
            height: 10.h,
          ),
          defaultText(
              txt: 'لا يوجد محل بهذا الرقم ',
              fontSize: 18.sp,
              fontWeight: FontWeight.bold)
        ],
      ),
    );
  }
}
