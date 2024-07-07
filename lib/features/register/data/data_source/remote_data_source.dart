import 'package:system_shop/core/database/api/dio_consumer.dart';
import 'package:system_shop/core/database/api/end_point.dart';
import 'package:system_shop/core/errors/errors.dart';
import 'package:system_shop/features/login/data/models/login_model.dart';
import 'package:system_shop/features/register/data/models/city.dart';
import 'package:system_shop/features/register/data/models/register_model.dart';
import 'package:system_shop/features/register/data/models/shops.dart';

class RegisterServices {
  static final DioHelper dioHelper = DioHelper.instance;

  static Future<RegisterModel?> register({
    String? email,
    String? password,
    String? shopName,
    String? company,
    String? name,
    String? phone,
  }) async {
    var response = await dioHelper.post(endPoint: ApiUrls.REGISTER_URL, query: {
      "email": email,
      "password": password,
      "shop_name": shopName,
      "company": company,
      "name": name,
      "phone": phone,
    });
    if (response.hashCode == 200) {
      return RegisterModel.fromJson(response?.data);
    } else {
      return null;
    }
  }

  // static Future<AllCities?> getCity() async {
  //   var response = await dioHelper.get(endpoint: ApiUrls.CITIES_URL);
  //   if (response == null) {
  //     return null;
  //   }
  //   return AllCities.fromJson(response.data);
  // }

  // static Future<AllShops?> getShops() async {
  //   var response = await dioHelper.get(endpoint: ApiUrls.SHOPS_URL);
  //   if (response == null) {
  //     return null;
  //   }
  //   return AllShops.fromJson(response.data);
  // }
}
