import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_shop/core/const/const.dart';
import 'package:system_shop/core/database/api/dio_consumer.dart';
import 'package:system_shop/core/database/api/end_point.dart';
import 'package:system_shop/core/database/cache/cache_helper.dart';
import 'package:system_shop/features/home/data/data_source/home_remote_data_source.dart';
import 'package:system_shop/features/home/data/model/user_profile.dart';
import 'package:system_shop/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:system_shop/features/profile/data/model/active_client.dart';
import 'package:system_shop/features/profile/data/model/get_return_funds.dart';
import 'package:system_shop/features/profile/data/model/pending_client.dart';
import 'package:system_shop/features/profile/presentaion/profile_cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(IntitialProfileStates());
  static ProfileCubit get(context) => BlocProvider.of(context);

  List<PendingClientData> client = [];
  List<GetFundData> getFunds = [];
  UserProfile? userData;

//  User data

  getUserData() async {
    try {
      emit(GetUserDataLoading());
      var user = await HomeServices.getUserData();
      userData = user;
      emit(GetUserDataSucsses());
    } catch (e) {
      if (kDebugMode) {
        print('error');
        emit(GetUserDataError());
      }
    }
  }

  // Pending Client
  Future getPendingClient() async {
    emit(GetPendingClientLoading());
    var list = await ProfileServices.getPendingClient();
    if (list!.status == true) {
      client = list.data ?? [];
      emit(GetPendingClientSucsses());
    } else if (list.status == false) {
      emit(GetPendingClientError());
    } else {
      emit(GetPendingClientFailed());
    }
  }
  Future getReturnFunds() async {
    emit(GetReturnFundsLoading());
    var list = await ProfileServices.getReturnFund();
    if (list!.status == true) {
      getFunds = list.data ?? [];
      emit(GetReturnFundsSucsses());
    } else if (list.status == false) {
      emit(GetReturnFundsError());
    } else {
      emit(GetReturnFundsFailed());
    }
  }

  ActiveClients? activeClients;
  activeClient(id) async {
    var formData = FormData.fromMap({"client_id": id});

    emit(ActiveClientLoading());

    DioHelper.postData(path: ApiUrls.ACTIVE_URL, data: formData).then((value) {
      activeClients = ActiveClients.fromJson(value.data);
      getPendingClient();
      emit(ActiveClientSucsses());
    }).catchError((er) {
      print(er.toString());
      emit(ActiveClientError());
    });
  }

  logout() async {
    await CacheHelper.removeShared(key: AppConst.kLogin);
    uid = CacheHelper.getShared(key: AppConst.kLogin);
    emit(LogoutSucsess());
  }
}
