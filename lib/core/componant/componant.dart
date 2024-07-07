import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/colors/colors.dart';

nextPage(
  context,
  Widget? page,
) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page!));
}

pop(context) {
  Navigator.pop(context);
}

nextPageUntil(
  context,
  Widget? page,
) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => page!), (route) => false);
}

Widget defaultText({
  String? txt,
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
}) =>
    Text(
      txt!,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontFamily: 'Tajawal',
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );

buildTextField({
  context,
  TextEditingController? controller,
  String? hint,
  String? label,
  Color color = Colors.white,
  IconData? icon,
  Function()? validate,
  Function? changed,
  IconData? suffixIcon,
  bool obscure = false,
  double width = double.infinity,
  TextInputType? type,
  Function()? press,
  Function()? ontap,
}) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  return Container(
    height: h * .060,
    width: w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        border: Border.all(color: Colors.black, width: .4)),
    child: TextFormField(
      validator: (value) => validate!(),
      onChanged: (value) => changed!(value),
      cursorColor: Colors.black,
      controller: controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.black),
        contentPadding: EdgeInsets.only(left: 10),
        hintText: hint,
        border: InputBorder.none,
      ),
    ),
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15.h),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

// final otpInputDecoration = InputDecoration(
//   contentPadding:
//       EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
//   border: outlineInputBorder(),
//   focusedBorder: outlineInputBorder(),
//   enabledBorder: outlineInputBorder(),
// );

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: AppColors.textColor),
  );
}

final headingStyle = TextStyle(
  fontSize: 28.sp,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
