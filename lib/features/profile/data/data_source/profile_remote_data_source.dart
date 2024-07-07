import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:system_shop/core/database/api/dio_consumer.dart';
import 'package:system_shop/core/database/api/end_point.dart';
import 'package:system_shop/features/profile/data/model/active_client.dart';
import 'package:system_shop/features/profile/data/model/get_return_funds.dart';
import 'package:system_shop/features/profile/data/model/pending_client.dart';

class ProfileServices {
  static var dioHelper = DioHelper.instance;

  // Banner
  static Future<PendingClients?> getPendingClient() async {
    try {
      var response = await dioHelper.get(endpoint: ApiUrls.PENDING_CLIENT_URL);
      if (response == null) {
        return null;
      }
      return PendingClients.fromJson(response.data);
    } catch (er) {
      if (kDebugMode) {
        print('Get Banner From Api');
      }
    }
    return null;
  }

  static Future<GetReturnFund?> getReturnFund() async {
    try {
      var response = await dioHelper.get(endpoint: ApiUrls.GET_RETURN_FUND_URL);
      if (response == null) {
        return null;
      }
      return GetReturnFund.fromJson(response.data);
    } catch (er) {
      if (kDebugMode) {
        print('Get ReturnFund From Api');
      }
    }
    return null;
  }

  static Future<ActiveClients?> activeClient(id) async {
    var formData = FormData.fromMap({"client_id": id});
    var response =
        await dioHelper.post(endPoint: ApiUrls.ACTIVE_URL, body: formData);
    return ActiveClients.fromJson(response!.data);
  }
}
