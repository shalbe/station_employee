import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/core/database/api/dio_consumer.dart';
import 'package:system_shop/core/database/api/end_point.dart';
import 'package:system_shop/features/home/data/model/return_fund.dart';
import 'package:system_shop/features/login/presentaion/screens/login_screen/login_screen.dart';
import 'package:system_shop/features/transactions/data/data_source/category_remote_data_source.dart';
import 'package:system_shop/features/transactions/data/model/get_all_sales.dart';
import 'package:system_shop/features/transactions/presentaion/cubit/transaction_state.dart';
// import 'package:system_shop/features/home/data/model/category_model.dart';

class TransactionCubit extends Cubit<TransactionStates> {
  TransactionCubit() : super(IntitialTransactionState());
  static TransactionCubit get(context) => BlocProvider.of(context);

  List<AllSalesData> allSales = [];

  // allSales
  getAllSales() async {
    emit(GetCategoryLoading());
    var list = await CategoryServices.getAllSales();
    if (list?.status == true) {
      allSales = list?.data ?? [];
      emit(GetCategorySucsses());
    } else if (list?.status == false) {
      emit(GetCategoryError());
    } else {
      emit(GetCategoryFailed());
    }
  }

  ReturnFund? returnFund;
  addReturnFund(id) {
    var formData= FormData.fromMap({
      "fund_id":id}
    );
    emit(ReturnFundLoading());
    DioHelper.postData(path: ApiUrls.RETURN_FUND_URL,
    data: formData
    ).then((value) {
      returnFund = ReturnFund.fromJson(value.data);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: defaultText(txt: returnFund?.msg.toString())));
      getAllSales();
      emit(ReturnFundSucsses());
    }).catchError((er) {
      print(er.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: defaultText(txt: 'هناك خطآ')));
      emit(ReturnFundError());
    });
  }

}
