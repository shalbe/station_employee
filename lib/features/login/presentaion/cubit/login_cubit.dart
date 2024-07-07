import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/core/const/const.dart';
import 'package:system_shop/core/database/cache/cache_helper.dart';
import 'package:system_shop/features/home_page/presentaion/screens/home_screen.dart';
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
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      var user = await LoginServices.login(
        email: emailController.text,
        password: passwordController.text,
      );
      try {
        if (user!.client!.status == 1) {
          await CacheHelper.setShared(
              key: AppConst.kLogin, value: user.accessToken);
          uid = CacheHelper.getShared(key: AppConst.kLogin);
          nextPageUntil(context, HomeScreen());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            'لم يتم تفعيل عضويتك حتي الان',
          )));
        }
        emit(LoginSuccess());
      } catch (er) {
        emit(LoginError());
      }
    }
  }
}
