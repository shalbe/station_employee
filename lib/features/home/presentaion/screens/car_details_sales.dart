import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_shop/core/colors/colors.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/core/componant/defult_button.dart';
import 'package:system_shop/features/home/data/componant/get_message.dart';
import 'package:system_shop/features/home/data/model/car_details.dart';
import 'package:system_shop/features/home/data/model/get_materials.dart';
import 'package:system_shop/features/home/data/model/latest_notifications.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_cubit.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_state.dart';

class CarsDetailsSales extends StatefulWidget {
  CarDetails? carDetails;
  int? carId;
  List<MaterialData>? data;
  CarsDetailsSales({
    super.key,
    this.carId,
    this.carDetails,
    this.data,
  });

  @override
  State<CarsDetailsSales> createState() => _CarsDetailsSalesState();
}

class _CarsDetailsSalesState extends State<CarsDetailsSales> {
  bool isMaterial = false;
  int? materialId;
  String? materialName;
  String? priceName;
  bool isMaterialPrice = false;
  String? priceMaterial;
  String? priceMaterialEn;
  List<String> prices = [
    'سعر 1',
    'سعر 2',
    'سعر 3',
    'سعر 4',
    'سعر 5',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomePageCubit cubit = HomePageCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(top: 50.h, left: 12.w, right: 12.w),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.grey,
                              ),
                            ),
                            defaultText(
                                txt: ' سداد الدين',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        widget.carDetails == null
                            ? Center(child: CircularProgressIndicator())
                            : Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(width: .2),
                                    color: Colors.white),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            defaultText(
                                                txt:
                                                    '  ${widget.carDetails!.data!.clientName}  ',
                                                fontSize: 11,
                                                color: AppColors.textColor,
                                                fontWeight: FontWeight.bold),
                                            defaultText(
                                                txt: 'اسم العميل',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            defaultText(
                                                txt:
                                                    '  ${widget.carDetails!.data!.number}  ',
                                                fontSize: 10,
                                                color: AppColors.textColor,
                                                fontWeight: FontWeight.bold),
                                            defaultText(
                                                txt: 'رقم السياره',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            defaultText(
                                                txt:
                                                    '  ${widget.carDetails!.data!.maxDebit}  ',
                                                fontSize: 10,
                                                color: AppColors.textColor,
                                                fontWeight: FontWeight.bold),
                                            defaultText(
                                                txt: ' مبلغ الدين المتاح',
                                                fontSize: 12,
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
                        SizedBox(
                          height: 15.h,
                        ),
                        Form(
                          key: cubit.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              defaultText(
                                  txt: 'مبلغ السداد',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                              SizedBox(
                                height: 15.h,
                              ),
                              TextFormField(
                                controller: cubit.amount,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'ادخل  مبلغ السداد';
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'ادخل  مبلغ السداد',
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.all(15),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InkWell(
                                onTap: () {
                                  cubit.carNumberDebitSell(widget
                                      .carDetails!.data!.number
                                      .toString());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: AppColors.buttonRedColor,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Center(
                                      child: defaultText(
                                          txt: 'تاكيد',
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isMaterial == true)
                    Padding(
                      padding: EdgeInsets.only(top: 180.h),
                      child: Container(
                        height: 200.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.separated(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      materialId = widget.data![index].id;
                                      materialName = widget.data![index].name;
                                      isMaterial = false;
                                    });
                                  },
                                  child: defaultText(
                                      txt: widget.data![index].name,
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) => Divider(
                                  height: 30.h,
                                  color: Colors.grey,
                                ),
                                itemCount: widget.data!.length,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (isMaterialPrice == true)
                    Padding(
                      padding: EdgeInsets.only(top: 180.h),
                      child: Container(
                        height: 200.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.separated(
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    if (index == 0) {
                                      setState(() {
                                        priceMaterialEn = 'price1';
                                        isMaterial = false;
                                        isMaterialPrice = false;
                                        priceMaterial = prices[index];
                                      });
                                    } else if (index == 1) {
                                      setState(() {
                                        priceMaterialEn = 'price2';
                                        isMaterial = false;
                                        isMaterialPrice = false;
                                        priceMaterial = prices[index];
                                      });
                                    } else if (index == 2) {
                                      setState(() {
                                        priceMaterialEn = 'price3';
                                        isMaterial = false;
                                        isMaterialPrice = false;
                                        priceMaterial = prices[index];
                                      });
                                    } else if (index == 3) {
                                      setState(() {
                                        priceMaterialEn = 'price4';
                                        isMaterial = false;
                                        isMaterialPrice = false;
                                        priceMaterial = prices[index];
                                      });
                                    } else if (index == 4) {
                                      setState(() {
                                        priceMaterialEn = 'price5';
                                        isMaterial = false;
                                        isMaterialPrice = false;
                                        priceMaterial = prices[index];
                                      });
                                    }

                                    print(priceMaterialEn);
                                  },
                                  child: defaultText(
                                      txt: prices[index],
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                shrinkWrap: true,
                                separatorBuilder: (context, index) => Divider(
                                  height: 30.h,
                                  color: Colors.grey,
                                ),
                                itemCount: prices.length,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        });
  }
}
