import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/core/database/api/dio_consumer.dart';
import 'package:system_shop/core/database/api/end_point.dart';
import 'package:system_shop/features/home/data/data_source/home_remote_data_source.dart';
import 'package:system_shop/features/home/data/model/add_car_price.dart';
import 'package:system_shop/features/home/data/model/add_fund.dart';
import 'package:system_shop/features/home/data/model/app_settings.dart';
import 'package:system_shop/features/home/data/model/cach_order.dart';
import 'package:system_shop/features/home/data/model/car_details.dart';
import 'package:system_shop/features/home/data/model/company_model.dart';
import 'package:system_shop/features/home/data/model/get_client_car.dart';
import 'package:system_shop/features/home/data/model/get_materials.dart';
import 'package:system_shop/features/home/data/model/get_payment_order.dart';
import 'package:system_shop/features/home/data/model/latest_notifications.dart';
import 'package:system_shop/features/home/data/model/pending_withdrew.dart';
import 'package:system_shop/features/home/data/model/return_fund.dart';
import 'package:system_shop/features/home/data/model/scan_client.dart';
import 'package:system_shop/features/home/data/model/sell_debit.dart';
import 'package:system_shop/features/home/data/model/top_sales.dart';
import 'package:system_shop/features/home/data/model/total_shop_sales.dart';
import 'package:system_shop/features/home/data/model/user_profile.dart';
import 'package:system_shop/features/home/presentaion/home_cubit/home_state.dart';
import 'package:system_shop/features/home/presentaion/screens/car_details.dart';
import 'package:system_shop/features/home/presentaion/screens/car_details_debit.dart';
import 'package:system_shop/features/home/presentaion/screens/home.dart';
import 'package:system_shop/features/home/presentaion/screens/not_found.dart';
import 'package:system_shop/main.dart';

class HomePageCubit extends Cubit<HomeState> {
  HomePageCubit() : super(IntitialHomeStates());
  static HomePageCubit get(context) => BlocProvider.of(context);
  List<MessageData> message = [];
  List<MessageData> AllMessage = [];
  List<CashOrderData> cashOrder = [];
  List<CashOrderData> debitOrder = [];
  List<PaymentOrderData> paymentOrder = [];
  List<pendingData> pendingWithDraw = [];
  List<pendingData> acceptedWithDraw = [];
  List<ClientCarData> carData = [];
  List<CompanyData> companyList = [];
  UserProfile? userData;
  double count = 0.0;
  GetTotalShopSales? totalSales;

  dynamic totalSalesInDay = 0.0;
  dynamic totalSaless = 0.0;
  dynamic stillDebit = 0.0;
  dynamic allCashSales = 0.0;
  dynamic allCashSalesToDay = 0.0;
  dynamic allDebitSales = 0.0;
  dynamic allDebitSalesToDay = 0.0;
  dynamic allPayments = 0.0;
  dynamic allPaymentsToDay = 0.0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController name = TextEditingController();

  AppSettings? appSettings;
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

  getPendingWithdraw() async {
    try {
      emit(GetPendingWithDrawLoading());
      var data = await HomeServices.getPendingWithdraw();
      pendingWithDraw = data?.data ?? [];
      emit(GetPendingWithDrawSucsses());
    } catch (e) {
      if (kDebugMode) {
        print('error');
        emit(GetPendingWithDrawError());
      }
    }
  }

  getAcceptedWithdraw() async {
    try {
      emit(GetPendingWithDrawLoading());
      var data = await HomeServices.getAcceptedWithdraw();
      acceptedWithDraw = data?.data ?? [];
      emit(GetPendingWithDrawSucsses());
    } catch (e) {
      if (kDebugMode) {
        print('error');
        emit(GetPendingWithDrawError());
      }
    }
  }

  getSettingsData() async {
    try {
      emit(GetSettingsDataLoading());
      var data = await HomeServices.getSettingsData();
      appSettings = data;
      emit(GetSettingsDataSucsses());
    } catch (e) {
      if (kDebugMode) {
        print('error');
        emit(GetSettingsDataError());
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

  // getLatestMessage() async {
  //   emit(GetlatestMessageLoading());
  //   var sales = await HomeServices.getLatestNotification();
  //   if (sales?.status == true) {
  //     message = sales?.data ?? [];
  //     emit(GetlatestMessageSucsses());
  //   } else if (sales?.status == false) {
  //     emit(GetlatestMessageError());
  //   } else {
  //     emit(GetTopSalesFailed());
  //   }
  // }

  getAllMessage() async {
    emit(GetAllMessageLoading());
    var sales = await HomeServices.getAllNotification();
    if (sales?.status == true) {
      AllMessage = sales?.data ?? [];
      emit(GetAllMessageSucsses());
    } else if (sales?.status == false) {
      emit(GetAllMessageError());
    } else {
      emit(GetTopSalesFailed());
    }
  }

  getCashOrder() async {
    emit(GetCashOrderLoading());
    var sales = await HomeServices.getCashOrder();
    if (sales?.status == true) {
      cashOrder = sales?.data ?? [];
      emit(GetCashOrderSucsses());
    } else if (sales?.status == false) {
      emit(GetCashOrderError());
    } else {
      emit(GetTopSalesFailed());
    }
  }

  getDebitOrder() async {
    emit(GetDebitOrderLoading());
    var sales = await HomeServices.getDebitOrder();
    if (sales?.status == true) {
      debitOrder = sales?.data ?? [];
      emit(GetDebitOrderSucsses());
    } else if (sales?.status == false) {
      emit(GetDebitOrderError());
    } else {
      emit(GetTopSalesFailed());
    }
  }

  getPaymentOrder() async {
    emit(GetDebitOrderLoading());
    var sales = await HomeServices.getPaymentsOrder();
    if (sales?.status == true) {
      paymentOrder = sales?.data ?? [];
      emit(GetDebitOrderSucsses());
    } else if (sales?.status == false) {
      emit(GetDebitOrderError());
    } else {
      emit(GetTopSalesFailed());
    }
  }

  // getClientCar() async {
  //   emit(GetClientCarLoading());
  //   var sales = await HomeServices.getClientCar();
  //   if (sales?.status == true) {
  //     carData = sales?.data ?? [];
  //     emit(GetClientCarSucsses());
  //   } else if (sales?.status == false) {
  //     emit(GetClientCarError());
  //   } else {
  //     emit(GetTopSalesFailed());
  //   }
  // }

  getCompanyList() async {
    emit(GetlatestMessageLoading());
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
  TextEditingController amount = TextEditingController();
  scanByNumber() {
    var formData = FormData.fromMap({"number": number.text});
    emit(ScanByIdLoading());
    DioHelper.postData(path: ApiUrls.SCAN_CLIENT_URL, data: formData)
        .then((value) {
      scanClientById = ScanClientById.fromJson(value.data);
      number.clear();
      // nextPage(context, page);
      emit(ScanByIdSucsses());
    }).catchError((er) {
      print(er.toString());
      emit(ScanByIdError());
    });
  }

  CarDetails? carDetails;
  carNumber() {
    var formData = FormData.fromMap({"number": number.text});
    emit(CarNumberLoading());
    DioHelper.postData(path: ApiUrls.SCAN_CLIENT_URL, data: formData)
        .then((value) {
      carDetails = CarDetails.fromJson(value.data);

      log('===============================${carDetails!.data!.materialName}');
      // nextPage(
      //     context,
      //     CarsDetails(
      //       carDetails: carDetails,
      //       data: getMaterials,
      //     ));
      // number.clear();

      emit(CarNumberSucsses());
    }).catchError((er) {
      print(er.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(carDetails!.msg.toString()),
        ),
      );
      emit(CarNumberError());
    });
  }

  CarDetails? carDebit;
  carNumberDebit() {
    var formData = FormData.fromMap({"number": number.text});
    emit(CarNumberDebitLoading());
    DioHelper.postData(path: ApiUrls.SCAN_DEBIT_URL, data: formData)
        .then((value) {
      carDebit = CarDetails.fromJson(value.data);

      log('===============================${carDebit!.data!.materialName}');
      nextPage(
          context,
          CarsDetailsDebit(
            carId: carDebit!.data!.id,
            carDetails: carDebit,
            data: getMaterials,
          ));
      // number.clear();

      emit(CarNumberDebitSucsses());
    }).catchError((er) {
      print(er.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(carDebit!.msg.toString()),
        ),
      );
      emit(CarNumberDebitError());
    });
  }

  SellDebit? sellDebit;
  carNumberDebitSell() {
    var formData = FormData.fromMap({
      "number": number.text,
      "amount": amount.text,
    });
    emit(CarNumberSellDebitLoading());
    DioHelper.postData(path: ApiUrls.MAKE_PAYMENT_URL, data: formData)
        .then((value) {
      sellDebit = SellDebit.fromJson(value.data);

      log('===============================${sellDebit!.msg}');
      // nextPage(
      //     context,
      //     CarsDetails(
      //       carDetails: carDetails,
      //       data: getMaterials,
      //     ));
      number.clear();
      amount.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(sellDebit!.msg.toString()),
        ),
      );
      getAllCashCount();
      getMateialData();
      getPendingWithdraw();
      getAcceptedWithdraw();
      // getLatestMessage();
      getSettingsData();
      getCachInDayCount();
      getAllSalesCount();
      // getStillDebitCount();
      getAllDebitInDayCount();
      getAllPaymentInDayCount();
      getAllPaymentCount();
      // getClientCar();
      getAllDebitCount();
      // getAllMessage();
      getCashOrder();
      getPaymentOrder();
      getDebitOrder();
      gettotalSalesToDayCount();

      emit(CarNumberSellDebitSucsses());
    }).catchError((er) {
      print(er.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(carDebit!.msg.toString()),
        ),
      );
      emit(CarNumberSellDebitError());
    });
  }

  SellDebit? creditDebit;
  carNumberCreditDebit() {
    var formData = FormData.fromMap({
      "credit": amount.text,
    });
    emit(CarCreditDebitLoading());
    DioHelper.postData(path: ApiUrls.MAKE_WITHDRAW_URL, data: formData)
        .then((value) {
      creditDebit = SellDebit.fromJson(value.data);

      log('===============================${creditDebit!.msg}');
      // nextPage(
      //     context,
      //     CarsDetails(
      //       carDetails: carDetails,
      //       data: getMaterials,
      //     ));
      number.clear();
      amount.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(creditDebit!.msg.toString()),
        ),
      );
      getAllCashCount();
      getMateialData();
      getPendingWithdraw();
      getAcceptedWithdraw();
      // getLatestMessage();
      getSettingsData();
      getCachInDayCount();
      getAllSalesCount();
      // getStillDebitCount();
      getAllDebitInDayCount();
      getAllPaymentInDayCount();
      getAllPaymentCount();
      // getClientCar();
      getAllDebitCount();
      // getAllMessage();
      getCashOrder();
      getPaymentOrder();
      getDebitOrder();
      gettotalSalesToDayCount();

      emit(CarCreditDebitSucsses());
    }).catchError((er) {
      print(er.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(carDebit!.msg.toString()),
        ),
      );
      emit(CarCreditDebitError());
    });
  }

  TextEditingController quantity = TextEditingController();
  TextEditingController carPrice = TextEditingController();
  TextEditingController notes = TextEditingController();
  var formKey = GlobalKey<FormState>();

  AddCarPrice? addCarPrice;
  sendCarDetails({int? carId, int? materialId, price}) {
    var formData = FormData.fromMap({
      "quantity": quantity.text,
      "material_id": materialId,
      "price": price,
      "notes": notes.text,
      "car_id": carId,
    });
    emit(SendCarNumberLoading());
    DioHelper.postData(path: ApiUrls.MAKE_CASH_URL, data: formData)
        .then((value) {
      carPrice.clear();
      quantity.clear();
      number.clear();
      notes.clear();

      addCarPrice = AddCarPrice.fromJson(value.data);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(addCarPrice!.msg.toString()),
        ),
      );
      getAllCashCount();
      getMateialData();
      getPendingWithdraw();
      getAcceptedWithdraw();
      // getLatestMessage();
      getSettingsData();
      getCachInDayCount();
      getAllSalesCount();
      // getStillDebitCount();
      getAllDebitInDayCount();
      getAllPaymentInDayCount();
      getAllPaymentCount();
      // getClientCar();
      getAllDebitCount();
      // getAllMessage();
      getCashOrder();
      getPaymentOrder();
      getDebitOrder();
      gettotalSalesToDayCount();
      pop(context);

      emit(SendCarNumberSucsses());
    }).catchError((er) {
      print(er.toString());
      emit(SendCarNumberError());
    });
  }

  AddCarPrice? addCarPriceDebit;
  sendCarDetailsDebit(
      {String? carId, int? materialId, String? price, int? id}) {
    var formData = FormData.fromMap({
      "quantity": quantity.text,
      "material_id": materialId,
      "price": price,
      "notes": notes.text,
      "car_id": id,
    });
    emit(SendCarNumberLoading());
    DioHelper.postData(path: ApiUrls.MAKE_DEBIT_URL, data: formData)
        .then((value) {
      addCarPriceDebit = AddCarPrice.fromJson(value.data);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(addCarPriceDebit!.msg.toString()),
        ),
      );
      carPrice.clear();
      quantity.clear();
      number.clear();
      notes.clear();
      getAllCashCount();
      getMateialData();
      getPendingWithdraw();
      getAcceptedWithdraw();
      // getLatestMessage();
      getSettingsData();
      getCachInDayCount();
      getAllSalesCount();
      // getStillDebitCount();
      getAllDebitInDayCount();
      getAllPaymentInDayCount();
      getAllPaymentCount();
      // getClientCar();
      getAllDebitCount();
      // getAllMessage();
      getCashOrder();
      getPaymentOrder();
      getDebitOrder();
      gettotalSalesToDayCount();
      pop(context);

      emit(SendCarNumberSucsses());
    }).catchError((er) {
      print(er.toString());
      emit(SendCarNumberError());
    });
  }

  List<MaterialData> getMaterials = [];
  getMateialData() async {
    emit(GetMaterialsLoading());
    try {
      var data = await HomeServices.getMaterials();
      getMaterials = data?.data ?? [];
      log('========== ]]]]]]]]]]]]]]]]]]]]${getMaterials.toString()}');
      emit(GetMaterialsSuccess());
    } catch (e) {
      emit(GetMaterialsError());
    }
  }

  String? success;
  // scan(id) {
  //   var formData = FormData.fromMap({"shop_id": id});
  //   emit(ScanByIdLoading());
  //   DioHelper.postData(path: ApiUrls.SCAN_URL, data: formData).then((value) {
  //     scanClientById = ScanClientById.fromJson(value.data);
  //     if (scanClientById!.status == true) {
  //       nextPage(context, UserData());
  //     } else {
  //       nextPage(context, ShopNotFount());
  //     }
  //     emit(ScanByIdSucsses());
  //   }).catchError((er) {
  //     print(er.toString());
  //     nextPage(context, ShopNotFount());
  //     emit(ScanByIdError());
  //   });
  // }

  AddFund? addFund;
  TextEditingController price = TextEditingController();

  loadData() async {
    await getAllCashCount();
    await getMateialData();
    await getPendingWithdraw();
    await getAcceptedWithdraw();
    // getLatestMessage();
    await getSettingsData();
    await getCachInDayCount();
    await getAllSalesCount();
    // getStillDebitCount();
    await getAllDebitInDayCount();
    await getAllPaymentInDayCount();
    await getAllPaymentCount();
    // getClientCar();
    await getAllDebitCount();
    // getAllMessage();
    await getCashOrder();
    await getPaymentOrder();
    await getDebitOrder();
    await gettotalSalesToDayCount();
    // await getTopSales();
    emit(GetPartenerSucsses());
  }

  // ReturnFund? returnFund;
  // addReturnFund({
  //   int? clientId,
  //   int? companyId,
  // }) {
  //   var formData = FormData.fromMap(
  //       {"price": price.text, "shop_id": clientId, "company_id": companyId});
  //   emit(ReturnFundLoading());
  //   DioHelper.postData(path: ApiUrls.RETURN_FUND_URL, data: formData)
  //       .then((value) {
  //     returnFund = ReturnFund.fromJson(value.data);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: defaultText(txt: returnFund?.msg.toString())));
  //     getTopSales();
  //     emit(ReturnFundSucsses());
  //   }).catchError((er) {
  //     print(er.toString());
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: defaultText(txt: 'هناك خطآ')));
  //     emit(ReturnFundError());
  //   });
  // }

  Future getAllSalesCount() async {
    emit(GetOrderCountLoading());
    var total = await HomeServices.getOrderCountData(ApiUrls.All_SALES_URL);
    if (total?.status == true) {
      totalSaless = total?.data ?? 0.0;
      emit(GetOrderCountSucsess());
    } else if (total?.status == false) {
      emit(GetOrderCountError());
    } else {
      emit(GetOrderCountfailed());
    }
  }

  Future gettotalSalesToDayCount() async {
    emit(GetOrderCountLoading());
    var total =
        await HomeServices.getOrderCountData(ApiUrls.All_SALES_TO_DAY_URL);
    if (total?.status == true) {
      totalSalesInDay = total?.data ?? 0.0;
      emit(GetOrderCountSucsess());
    } else if (total?.status == false) {
      emit(GetOrderCountError());
    } else {
      emit(GetOrderCountfailed());
    }
  }

  Future getStillDebitCount() async {
    emit(GetOrderCountLoading());
    var total = await HomeServices.getOrderCountData(ApiUrls.STILL_DEBIT_URL);
    if (total?.status == true) {
      stillDebit = total?.data ?? 0.0;
      emit(GetOrderCountSucsess());
    } else if (total?.status == false) {
      emit(GetOrderCountError());
    } else {
      emit(GetOrderCountfailed());
    }
  }

  Future getAllCashCount() async {
    emit(GetOrderCountLoading());
    var total =
        await HomeServices.getOrderCountData(ApiUrls.ALL_CASH_SALES_URL);
    if (total?.status == true) {
      allCashSales = total?.data ?? 0.0;
      emit(GetOrderCountSucsess());
    } else if (total?.status == false) {
      emit(GetOrderCountError());
    } else {
      emit(GetOrderCountfailed());
    }
  }

  Future getCachInDayCount() async {
    emit(GetOrderCountLoading());
    var total =
        await HomeServices.getOrderCountData(ApiUrls.ALL_CASH_SALES_TO_DAY_URL);
    if (total?.status == true) {
      allCashSalesToDay = total?.data ?? 0.0;
      emit(GetOrderCountSucsess());
    } else if (total?.status == false) {
      emit(GetOrderCountError());
    } else {
      emit(GetOrderCountfailed());
    }
  }

  Future getAllDebitCount() async {
    emit(GetOrderCountLoading());
    var total =
        await HomeServices.getOrderCountData(ApiUrls.ALL_DEBIT_SALES_URL);
    if (total?.status == true) {
      allDebitSales = total?.data ?? 0.0;
      emit(GetOrderCountSucsess());
    } else if (total?.status == false) {
      emit(GetOrderCountError());
    } else {
      emit(GetOrderCountfailed());
    }
  }

  Future getAllDebitInDayCount() async {
    emit(GetOrderCountLoading());
    var total = await HomeServices.getOrderCountData(
        ApiUrls.ALL_DEBIT_SALES_TO_DAY_URL);
    if (total?.status == true) {
      allDebitSalesToDay = total?.data ?? 0.0;
      emit(GetOrderCountSucsess());
    } else if (total?.status == false) {
      emit(GetOrderCountError());
    } else {
      emit(GetOrderCountfailed());
    }
  }

  Future getAllPaymentCount() async {
    emit(GetOrderCountLoading());
    var total = await HomeServices.getOrderCountData(ApiUrls.ALL_PAYMENTS_URL);
    if (total?.status == true) {
      allPayments = total?.data ?? 0.0;
      emit(GetOrderCountSucsess());
    } else if (total?.status == false) {
      emit(GetOrderCountError());
    } else {
      emit(GetOrderCountfailed());
    }
  }

  Future getAllPaymentInDayCount() async {
    emit(GetOrderCountLoading());
    var total =
        await HomeServices.getOrderCountData(ApiUrls.ALL_PAYMENTS_TO_DAY_URL);
    if (total?.status == true) {
      allPaymentsToDay = total?.data ?? 0.0;
      emit(GetOrderCountSucsess());
    } else if (total?.status == false) {
      emit(GetOrderCountError());
    } else {
      emit(GetOrderCountfailed());
    }
  }
}
