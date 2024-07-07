import 'package:dio/dio.dart';
import 'package:system_shop/core/database/api/dio_consumer.dart';
import 'package:system_shop/core/database/api/end_point.dart';
import 'package:system_shop/core/errors/errors.dart';
import 'package:system_shop/features/login/data/models/login_model.dart';

class LoginServices {
  static final DioHelper dioHelper = DioHelper.instance;

  static Future<LoginModel?> login({
    String? email,
    String? password,
  }) async {
    var formData = FormData.fromMap({
      "email": email,
      "password": password,
    });
    var response =
        await dioHelper.post(endPoint: ApiUrls.LOGIN_URL, body: formData);
    // if (response.hashCode == 200) {
    return LoginModel.fromJson(response?.data);
    // } else {
    //   return null;
    // }
  }
}
