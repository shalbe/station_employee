import 'package:flutter/foundation.dart';
import 'package:system_shop/core/database/api/dio_consumer.dart';
import 'package:system_shop/core/database/api/end_point.dart';
import 'package:system_shop/features/home/data/model/app_settings.dart';
import 'package:system_shop/features/home/data/model/cach_order.dart';
import 'package:system_shop/features/home/data/model/company_model.dart';
import 'package:system_shop/features/home/data/model/get_client_car.dart';
import 'package:system_shop/features/home/data/model/get_materials.dart';
import 'package:system_shop/features/home/data/model/get_order_count.dart';
import 'package:system_shop/features/home/data/model/get_payment_order.dart';
import 'package:system_shop/features/home/data/model/latest_notifications.dart';
import 'package:system_shop/features/home/data/model/pending_withdrew.dart';
import 'package:system_shop/features/home/data/model/top_sales.dart';
import 'package:system_shop/features/home/data/model/total_shop_sales.dart';
import 'package:system_shop/features/home/data/model/user_profile.dart';
import 'package:system_shop/features/home/presentaion/screens/payments_order.dart';

class HomeServices {
  static var dioHelper = DioHelper.instance;

// user Profile

  static Future<UserProfile?> getUserData() async {
    var response = await dioHelper.get(endpoint: ApiUrls.USER_DATA_URL);
    if (response == null) {
      return null;
    }
    return UserProfile.fromJson(response.data);
  }
  static Future<AppSettings?> getSettingsData() async {
    var response = await dioHelper.get(endpoint: ApiUrls.SETTING_URL);
    if (response == null) {
      return null;
    }
    return AppSettings.fromJson(response.data);
  }

  // top Sales

  // static Future<LatestNotification?> getLatestNotification() async {
  //   var response = await dioHelper.get(endpoint: ApiUrls.MESSAGE_URL);
  //   if (response == null) {
  //     return null;
  //   }
  //   return LatestNotification.fromJson(response.data);
  // }
 
 
  static Future<LatestNotification?> getAllNotification() async {
    var response = await dioHelper.get(endpoint: ApiUrls.ALL_MESSAGE_URL);
    if (response == null) {
      return null;
    }
    return LatestNotification.fromJson(response.data);
  }
  static Future<GetMaterials?> getMaterials() async {
    var response = await dioHelper.get(endpoint: ApiUrls.MATERIAL_URL);
    if (response == null) {
      return null;
    }
    return GetMaterials.fromJson(response.data);
  }
  static Future<CashOrder?> getCashOrder() async {
    var response = await dioHelper.get(endpoint: ApiUrls.CASH_ORDER_URL);
    if (response == null) {
      return null;
    }
    return CashOrder.fromJson(response.data);
  }
 
  static Future<CashOrder?> getDebitOrder() async {
    var response = await dioHelper.get(endpoint: ApiUrls.DEBIT_ORDER_URL);
    if (response == null) {
      return null;
    }
    return CashOrder.fromJson(response.data);
  }
 
  static Future<GetPaymentsOrder?> getPaymentsOrder() async {
    var response = await dioHelper.get(endpoint: ApiUrls.PAYMENTS_URL);
    if (response == null) {
      return null;
    }
    return GetPaymentsOrder.fromJson(response.data);
  }
  static Future<pendingWithdraws?> getPendingWithdraw() async {
    var response = await dioHelper.get(endpoint: ApiUrls.PENDING_WITHDRAW_URL);
    if (response == null) {
      return null;
    }
    return pendingWithdraws.fromJson(response.data);
  }
 
  static Future<pendingWithdraws?> getAcceptedWithdraw() async {
    var response = await dioHelper.get(endpoint: ApiUrls.ACCEPT_WITHDRAW_URL);
    if (response == null) {
      return null;
    }
    return pendingWithdraws.fromJson(response.data);
  }
 
  static Future<GetClientCar?> getClientCar() async {
    var response = await dioHelper.get(endpoint: ApiUrls.CLIENT_CAR_URL);
    if (response == null) {
      return null;
    }
    return GetClientCar.fromJson(response.data);
  }
 
 
 
  // total shop Sales

  static Future<GetTotalShopSales?> getTotalShopSales() async {
    var response = await dioHelper.get(endpoint: ApiUrls.TOP_SALES_URL);
    if (response == null) {
      return null;
    }
    return GetTotalShopSales.fromJson(response.data);
  }
  // Company List

  static Future<CompanyModel?> getCompanyData() async {
    var response = await dioHelper.get(endpoint: ApiUrls.COMPANY_URL);
    if (response == null) {
      return null;
    }
    return CompanyModel.fromJson(response.data);
  }

  static Future<GetOrderCountData?> getOrderCountData(endPoint) async {
    try {
      var response = await dioHelper.get(endpoint: endPoint);
      if (response == null) {
        return null;
      }
      return GetOrderCountData.fromJson(response.data);
    } catch (e) {
      print(' get Order count data api field');
    }
    return null;
  }

}
