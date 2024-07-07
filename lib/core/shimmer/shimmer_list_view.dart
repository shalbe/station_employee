import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListView extends StatelessWidget {
  var hieghts;
  var width;
   ShimmerListView({super.key,this.hieghts,this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: hieghts,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (context, index) => SizedBox(
                width: 20.w,
              ),
              itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade200,
                enabled: true,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: hieghts,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.grey.shade200,
                        ),
                      ),
                      // SizedBox(
                      //   height: 16.h,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Column(
                      //       children: [
                      //         Container(
                      //           height: 10.h,
                      //           width: 60.w,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(4),
                      //             color: Colors.grey.shade200,
                      //           ),
                      //         ),
                      //         SizedBox(height: 16.0),
                      //         Container(
                      //           height: 10.h,
                      //           width: 60.w,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(4),
                      //             color: Colors.grey.shade200,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
