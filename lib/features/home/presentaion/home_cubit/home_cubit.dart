import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/core/database/api/dio_consumer.dart';
import 'package:system_shop/core/database/api/end_point.dart';
import 'package:system_shop/features/home/data/data_source/home_remote_data_source.dart';
import 'package:system_shop/features/home/data/model/add_fund.dart';
import 'package:system_shop/features/home/data/model/company_model.dart';
import 'package:system_shop/features/home/data/model/return_fund.dart';
import 'package:system_shop/features/home/data/model/scan_client.dart';
import 'package:system_shop/features/home/data/model/top_sales.dart';
import 'package:system_shop/features/home/data/model/total_shop_sales.dart';
import 'package:system_shop/features/home/data/model/user_profile.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_state.dart';
import 'package:system_shop/features/home/presentaion/screens/home.dart';
import 'package:system_shop/features/home/presentaion/screens/not_found.dart';
import 'package:system_shop/features/home/presentaion/screens/user_data.dart';
import 'package:system_shop/features/home/presentaion/screens/write_user_number.dart';
import 'package:system_shop/main.dart';

class HomePageCubit extends Cubit<HomeState> {
  HomePageCubit() : super(IntitialHomeStates());
  static HomePageCubit get(context) => BlocProvider.of(context);
  List<TopSalesData> salesData = [];
  List<CompanyData> companyList = [];
  UserProfile? userData;
  double count = 0.0;
  GetTotalShopSales? totalSales;
//  User data

  getUserData() async {
    try {
      emit(GetUserDataLoading());
      var user = await HomeServices.getUserData();
      userData = user;
      emit(GetUserDataSucsses());
    } catch (e) {
      if (kDebugMode) {
        print('error');
        emit(GetUserDataError());
      }
    }
  }

// total Shop Sales
  var dioHelper = DioHelper.instance;
  getTotalShopSales() async {
    emit(GetTotalShopSalesLoading());
    dioHelper.get(endpoint: ApiUrls.TOP_SALES_URL).then((value) {
      totalSales = GetTotalShopSales.fromJson(value!.data);
      print(totalSales!.data);
      emit(GetTotalShopSalesSucsses());
    }).catchError((er) {
      print(er.toString());
      emit(GetTotalShopSalesError());
    });
  }

  getTopSales() async {
    emit(GetTopSalesLoading());
    var sales = await HomeServices.getTopSales();
    if (sales?.status == true) {
      salesData = sales?.data ?? [];
      emit(GetTopSalesSucsses());
    } else if (sales?.status == false) {
      emit(GetTopSalesError());
    } else {
      emit(GetTopSalesFailed());
    }
  }

  getCompanyList() async {
    emit(GetTopSalesLoading());
    var List = await HomeServices.getCompanyData();
    if (List?.status == true) {
      companyList = List?.data ?? [];
      print('companyList===============$companyList');
      emit(GetCompanySucsses());
    } else if (List?.status == false) {
      emit(GetCompanyError());
    } else {
      emit(GetCompanyFailed());
    }
  }

  int? clientId;
  ScanClientById? scanClientById;
  TextEditingController number = TextEditingController();
  scanByNumber() {
    var formData = FormData.fromMap({"number": number.text});
    emit(ScanByIdLoading());
    DioHelper.postData(path: ApiUrls.SCAN_CLIENT_URL, data: formData)
        .then((value) {
      scanClientById = ScanClientById.fromJson(value.data);
      number.clear();
      emit(ScanByIdSucsses());
    }).catchError((er) {
      print(er.toString());
      emit(ScanByIdError());
    });
  }

  String? success;
  scan(id) {
    var formData = FormData.fromMap({"shop_id": id});
    emit(ScanByIdLoading());
    DioHelper.postData(path: ApiUrls.SCAN_URL, data: formData).then((value) {
      scanClientById = ScanClientById.fromJson(value.data);
      if (scanClientById!.status == true) {
        nextPage(context, UserData());
      } else {
        nextPage(context, ShopNotFount());
      }
      emit(ScanByIdSucsses());
    }).catchError((er) {
      print(er.toString());
      nextPage(context, ShopNotFount());
      emit(ScanByIdError());
    });
  }

  AddFund? addFund;
  TextEditingController price = TextEditingController();

  addNewFund({
    int? clientId,
    int? companyId,
  }) {
    var formData = FormData.fromMap(
        {"price": price.text, "shop_id": clientId, "company_id": companyId});
    emit(AddFundLoading());
    DioHelper.postData(path: ApiUrls.ADD_FUND_URL, data: formData)
        .then((value) {
      addFund = AddFund.fromJson(value.data);
      price.clear();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(addFund!.msg.toString())));
      emit(AddFundSucsses());
    }).catchError((er) {
      print(er.toString());
      emit(AddFundError());
    });
  }

  loadData() async {
    await getUserData();

    emit(GetPartenerSucsses());
  }

  ReturnFund? returnFund;
  addReturnFund({
    int? clientId,
    int? companyId,
  }) {
    var formData = FormData.fromMap(
        {"price": price.text, "shop_id": clientId, "company_id": companyId});
    emit(ReturnFundLoading());
    DioHelper.postData(path: ApiUrls.RETURN_FUND_URL, data: formData)
        .then((value) {
      returnFund = ReturnFund.fromJson(value.data);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: defaultText(txt: returnFund?.msg.toString())));
      getTopSales();
      emit(ReturnFundSucsses());
    }).catchError((er) {
      print(er.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: defaultText(txt: 'هناك خطآ')));
      emit(ReturnFundError());
    });
  }

}
