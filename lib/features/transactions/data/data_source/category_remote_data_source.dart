import 'package:flutter/foundation.dart';
import 'package:system_shop/core/database/api/dio_consumer.dart';
import 'package:system_shop/core/database/api/end_point.dart';
import 'package:system_shop/features/transactions/data/model/get_all_sales.dart';

class CategoryServices {
  static var dioHelper = DioHelper.instance;

  // All Product By Category
  static Future<GetAllSales?> getAllSales() async {
    try {
      var response = await dioHelper.get(
        endpoint: ApiUrls.ALL_SALES_URL,
      );

      if (response == null) {
        return null;
      }
      return GetAllSales.fromJson(response.data);
    } catch (er) {
      if (kDebugMode) {
        print('error in Product By Category Api');
      }
    }
    return null;
  }
}
