import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/core/const/const.dart';
import 'package:system_shop/core/database/api/dio_consumer.dart';
import 'package:system_shop/core/database/api/end_point.dart';
import 'package:system_shop/core/database/cache/cache_helper.dart';
import 'package:system_shop/features/home/presentaion/screens/home.dart';
import 'package:system_shop/features/login/data/data_source/remote_data_source.dart';
import 'package:system_shop/features/login/data/models/login_model.dart';
import 'package:system_shop/features/login/presentaion/cubit/login_states.dart';
import 'package:system_shop/features/login/presentaion/screens/login_screen/login_screen.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInstialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginModel? loginModel;
  Future login() async {
    emit(LoginLoading());
    // var user = await LoginServices.login(
    //   email: emailController.text,
    //   password: passwordController.text,
    // );
    var formData = FormData.fromMap({
      "email": emailController.text,
      "password": passwordController.text,
    });
    DioHelper.postData(path: ApiUrls.LOGIN_URL, data: formData)
        .then((value) async {
      loginModel = LoginModel.fromJson(value.data);
      await CacheHelper.setShared(
          key: AppConst.kLogin, value: loginModel!.accessToken);
      uid = CacheHelper.getShared(key: AppConst.kLogin);
      nextPageUntil(context, Home());

      emit(LoginSuccess());
    }).catchError((er) {
      print(er.toString());
      emit(LoginError());
    });
  }
}
