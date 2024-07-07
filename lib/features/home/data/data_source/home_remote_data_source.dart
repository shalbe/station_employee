import 'package:flutter/foundation.dart';
import 'package:system_shop/core/database/api/dio_consumer.dart';
import 'package:system_shop/core/database/api/end_point.dart';
import 'package:system_shop/features/home/data/model/company_model.dart';
import 'package:system_shop/features/home/data/model/top_sales.dart';
import 'package:system_shop/features/home/data/model/total_shop_sales.dart';
import 'package:system_shop/features/home/data/model/user_profile.dart';

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

  // top Sales

  static Future<TopSales?> getTopSales() async {
    var response = await dioHelper.get(endpoint: ApiUrls.TOP_SALES_URL);
    if (response == null) {
      return null;
    }
    return TopSales.fromJson(response.data);
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
}
