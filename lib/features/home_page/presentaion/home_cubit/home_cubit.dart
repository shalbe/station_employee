import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_shop/features/profile/presentaion/screens/profile.dart';
import 'package:system_shop/features/transactions/presentaion/screens/transaction_screen.dart';
import 'package:system_shop/features/home/presentaion/screens/home.dart';
import 'package:system_shop/features/home_page/presentaion/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(IntitialHomeState());
  static HomeCubit get(context) => BlocProvider.of(context);

  List<Widget> screen = [
    Profile(),
    Transactions(),
    Home(),
  ];

  int indexScreen = 2;

  changeIndex(index) {
    indexScreen = index;
    emit(ChangeIndexState());
  }

  changeIndexHome(index) {
    indexScreen = 2;
    emit(ChangeIndexState());
  }
}
