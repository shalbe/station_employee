import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGridView extends StatelessWidget {
  ShimmerGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: 630.h,
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: 10,
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
                          height: 160.h,
                          width: double.infinity,
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
      ),
    );
  }
}
