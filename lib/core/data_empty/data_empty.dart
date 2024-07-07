import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/componant/componant.dart';

class DataEmpty extends StatelessWidget {
  const DataEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            'assets/images/no-results.png',
            height: 100.h,
            width: 200.w,
          ),
          SizedBox(
            height: 20.h,
          ),
          defaultText(
              txt: 'لا توجد نتائج', fontSize: 19, fontWeight: FontWeight.bold)
        ],
      ),
    );
  }
}
