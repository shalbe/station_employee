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

class CarsDetailsDebit extends StatefulWidget {
  CarDetails? carDetails;
  int? carId;
  List<MaterialData>? data;
  CarsDetailsDebit({
    super.key,
    this.carId,
    this.carDetails,
    this.data,
  });

  @override
  State<CarsDetailsDebit> createState() => _CarsDetailsDebitState();
}

class _CarsDetailsDebitState extends State<CarsDetailsDebit> {
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
                                txt: ' البيع بالدين',
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
                                                txt: 'اسم العميل',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                            defaultText(
                                                txt:
                                                    '  ${widget.carDetails!.data!.clientName}  ',
                                                fontSize: 11,
                                                color: AppColors.textColor,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            defaultText(
                                                txt: 'رقم السياره',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                            defaultText(
                                                txt:
                                                    '  ${widget.carDetails!.data!.number}  ',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            defaultText(
                                                txt: 'اسم الماده',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                            defaultText(
                                                txt:
                                                    '  ${widget.carDetails!.data!.materialName}  ',
                                                fontSize: 10,
                                                color: AppColors.textColor,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            defaultText(
                                                txt: 'سعر الماده  ',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                            defaultText(
                                                txt:
                                                    '  ${widget.carDetails!.data!.price}  ',
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
                        SizedBox(
                          height: 15.h,
                        ),
                        Form(
                          key: cubit.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              defaultText(
                                  txt: 'الكميه',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                              SizedBox(
                                height: 15.h,
                              ),
                              TextFormField(
                                controller: cubit.quantity,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'ادخل الكميه';
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'ادخل الكميه',
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
                              defaultText(
                                  txt: 'الملاحظات',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                              SizedBox(
                                height: 15.h,
                              ),
                              TextField(
                                controller: cubit.number,
                                keyboardType: TextInputType.name,
                                maxLength: 10,
                                minLines: 1,
                                decoration: InputDecoration(
                                  hintText: ' الملاحظات',
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
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        defaultText(
                                            txt: 'سعر الماده',
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isMaterialPrice = true;
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(width: .2),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Center(
                                                child: defaultText(
                                              txt:
                                                  priceMaterial ?? 'سعر الماده',
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.normal,
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        defaultText(
                                          txt: 'الماده',
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isMaterial = true;
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(width: .2),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Center(
                                                child: defaultText(
                                              txt: materialName ?? 'الماده',
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.normal,
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              InkWell(
                                onTap: () {
                                  if (materialId == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('اختر الماده'),
                                      ),
                                    );
                                  } else if (priceMaterial == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(' حدد سعر الماده'),
                                      ),
                                    );
                                  } else {
                                    if (cubit.formKey.currentState!
                                        .validate()) {
                                      cubit.sendCarDetailsDebit(
                                        price: priceMaterialEn,
                                        id:widget.carDetails!.data!.id ,
                                          materialId: materialId);
                                    }
                                  }
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
