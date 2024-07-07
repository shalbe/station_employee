import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:system_shop/core/componant/componant.dart';
import 'package:system_shop/core/database/api/dio_consumer.dart';
import 'package:system_shop/core/database/api/end_point.dart';
import 'package:system_shop/features/home/presentaion/screens/home.dart';
import 'package:system_shop/features/login/data/data_source/remote_data_source.dart';
import 'package:system_shop/features/login/data/models/login_model.dart';
import 'package:system_shop/features/login/presentaion/cubit/login_states.dart';
import 'package:system_shop/features/login/presentaion/screens/login_screen/login_screen.dart';
import 'package:system_shop/features/register/data/data_source/remote_data_source.dart';
import 'package:system_shop/features/register/data/models/city.dart';
import 'package:system_shop/features/register/data/models/register_model.dart';
import 'package:system_shop/features/register/data/models/register_model.dart';
import 'package:system_shop/features/register/data/models/shops.dart';
import 'package:system_shop/features/register/presentaion/cubit/register_states.dart';
import 'package:http_parser/src/media_type.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInstialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  List<CityData> cityList = [];
  List<ShopsData> shopList = [];
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  RegisterModel? registerModel;

  File? imageSugget;
  var picker = ImagePicker();

  void uploadImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageSugget = File(image.path);
      emit(UploadImage());
    } else {
      print('no images');
      emit(UploadImageError());
    }
  }

  Future register({
    int? cityId,
    int? shopId,
  }) async {
    var formData = FormData.fromMap({
      "name": nameController.text,
      "password": passwordController.text,
      "email": emailController.text,
    });
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      DioHelper.postData(path: ApiUrls.REGISTER_URL, data: formData)
          .then((value) {
        registerModel = RegisterModel.fromJson(value.data);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(registerModel!.message.toString())));
        nextPage(context, LoginScreen());
        emit(RegisterSuccess(registerModel!.message));
      }).catchError((er) {
        print(er.toString());
        emit(RegisterError());
      });
    }
  }

 
}
