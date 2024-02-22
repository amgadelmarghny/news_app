import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/network/local/shared_pref_helper.dart';
import 'package:news_app/shared/network/remot/dio_helper.dart';
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

  // @index is the page number that you want to go.
  void changeBody(int index) {
    currentIndex = index;
    if (index == 0) {
      getData(category: 'business');
    } else if (index == 1) {
      getData(category: 'sports');
    } else if (index == 2) {
      getData(category: 'science');
    }
    emit(BottomNavBarState());
  }

  bool isDark = false;
  void changThemeMode({bool? fromShared}) async {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeSystemThemeState());
    } else {
      isDark = !isDark;
      await CashHelper.setSharePref(isDark: isDark).then((value) {
        emit(ChangeSystemThemeState());
      });
    }
  }

/////////////////////////////////////
  List<dynamic> newsList = [];

  void getData({required String category}) async {
    emit(LoadingState());
    await DioHelper.get(url: 'v2/top-headlines', query: {
      "country": 'us',
      "category": category,
      "apiKey": '708d777b7af549bfbcbe9c715aeeade6 ',
    }).then((value) {
      newsList = value.data['articles'];
      emit(GetSuccessState());
    }).catchError((err) {
      debugPrint('There is an error : $err');
      emit(FailurState(err: 'There is an error : $err'));
    });
  }
}
