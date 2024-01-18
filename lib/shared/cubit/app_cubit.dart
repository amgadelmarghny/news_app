import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/network/remot/dio.dart';
import 'package:news_app/views/business_body.dart';
import 'package:news_app/views/sciences_body.dart';
import 'package:news_app/views/sports_body.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  int currentIndex = 0;
  List<Widget> currentBody = const [
    BusinessBody(),
    SportsBody(),
    SciencesBody(),
  ];
  List<BottomNavigationBarItem> navBarItem = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center_outlined), label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_baseball_outlined), label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: 'Science'),
  ];

  // @index is the page number that you want to go, not the item in list
  void changeBody(int index) {
    currentIndex = index;
    if (index == 0) {
      getData();
    }
    
    emit(BottomNavBarState());
  }

/////////////////////////////////
  List<dynamic> newsList = [];

  void getData(
      //{required String category}
      ) async {
    emit(DioLoadingState());
    await DioHelper.get(url: 'v2/top-headlines', query: {
      "country": 'eg',
      "category": 'business',
      "apiKey": '708d777b7af549bfbcbe9c715aeeade6',
    }).then((value) {
      newsList = value.data['articles'];
      print('@@@@@@@@@ $newsList');
      emit(DioGetMethodState());
    }).catchError((err) {
      print('There is an error : $err');
      emit(DioFailurState(err: 'There is an error : $err'));
    });
  }
}
