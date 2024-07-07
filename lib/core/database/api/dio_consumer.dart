import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:system_shop/core/const/const.dart';
import 'package:system_shop/core/database/api/end_point.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static late Dio dio;

  static init() async {
    dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 60), // 60 seconds
        receiveTimeout: Duration(seconds: 60),

        baseUrl: ApiUrls.BASE_URL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  DioHelper._() {
    // Attach Logger
    if (kDebugMode) _dio.interceptors.add(_logger);
  }

  static final DioHelper instance = DioHelper._();

  // Http Client
  final Dio _dio = Dio(BaseOptions(
      baseUrl: ApiUrls.BASE_URL,
      receiveDataWhenStatusError: true,
      headers: {
        "X-Oc-Merchant-Id": "123",
      }));

  addHeader(String key, dynamic value) {
    _dio.options.headers[key] = value;
    // "X-Oc-Merchant-Language": "en-gb",
    //"ir_arabic"
  }

  // Headers
  final Map<String, dynamic> _apiHeaders = <String, dynamic>{
    "Accept-Language": "ar",
    // 'Content-Type': 'multipart/form-data',
  };

  // Logger
  final PrettyDioLogger _logger = PrettyDioLogger(
    requestBody: true,
    responseBody: true,
    error: true,
  );

  Future<Response?> get(
      {required String endpoint,
      dynamic headers = const {},
      Map<String, dynamic> queryParameters = const {}}) async {
    // String? accessToken =
    //     MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    // if (kDebugMode) {
    //   print("Access token: $accessToken");
    // }

    print("headers $headers");
    try {
      return await _dio.get(endpoint,
          queryParameters: queryParameters,
          options: Options(
            headers: {"Authorization": "Bearer $uid"},
            validateStatus: (int? status) {
              return status != null;
              // return status != null && status >= 200 && status < 300;
            },
          ));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<Response> postData({
    required String path,
    String? token,
    dynamic data,
    // Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $uid",
      // "secretKey": "tgCiGblcr1daxYxx3Lw8uw==",
      'Content-type': 'multipart/form-data'
    };
    return await dio.post(
      path,
      data: data,
      //  queryParameters: data
    );
  }

  Future<Response?> postFormData(
      {required String endPoint,
      dynamic headers = const {},
      Map<String, dynamic> formBody = const {}}) async {
    try {
      return await _dio.post(endPoint,
          options: Options(
              headers: {"Authorization": "Bearer $uid"},
              validateStatus: (int? status) {
                if (status! >= 200 && status <= 600) {
                  return true;
                }
                return false;
              }),
          data: FormData.fromMap(
            formBody,
          ));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<Response?> putFormData(
      {required String endPoint,
      Map<String, dynamic> formBody = const {}}) async {
    try {
      return await _dio.put(
        endPoint,
        data: FormData.fromMap(formBody),
        options: Options(
            headers: {"Authorization": "Bearer $uid"},
            validateStatus: (int? status) {
              if (status! >= 200 && status <= 600) {
                return true;
              }
              return false;
            }),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<Response?> post(
      {required String endPoint,
      dynamic body,
      dynamic query = const {},
      Map<String, dynamic> headers = const {}}) async {
    // String? accessToken =
    //     MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    // if (kDebugMode) {
    //   print("Access token: $accessToken");
    // }
    print("headers $headers");

    try {
      return await _dio.post(
        endPoint,
        data: body,
        queryParameters: query,
        options: Options(
            headers: {"Authorization": "Bearer $uid"},
            validateStatus: (int? status) {
              if (status! >= 200 && status <= 600) {
                return true;
              }
              return false;
            }),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<Response?> delete(
      {required String endPoint,
      dynamic body = const {},
      dynamic queryParameters = const {},
      Map<String, dynamic> headers = const {}}) async {
    // String? accessToken =
    //     MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    // if (kDebugMode) {
    //   print("Access token: $accessToken");
    // }
    if (kDebugMode) {
      print("headers $headers");
    }

    try {
      return await _dio.delete(
        endPoint,
        data: body,
        queryParameters: queryParameters,
        options: Options(
            headers: {"Authorization": "Bearer $uid"},
            validateStatus: (int? status) {
              if (status! >= 200 && status <= 600) {
                return true;
              }
              return false;
            }),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<Response?> put(
      {required String endPoint,
      dynamic body = const {},
      Map<String, dynamic> headers = const {}}) async {
    // String? accessToken =
    //     MyApp.navKey.currentState!.context.read<AuthCubit>().accessToken;
    // if (kDebugMode) {
    //   print("Access token: $accessToken");
    // }
    if (kDebugMode) {
      print("headers $headers");
    }

    try {
      return await _dio.put(
        endPoint,
        data: body,
        options: Options(
            headers: {"Authorization": "Bearer $uid"},
            validateStatus: (int? status) {
              if (status! >= 200 && status <= 600) {
                return true;
              }
              return false;
            }),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
