import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  void changeBody(int index) {
    currentIndex = index;
    emit(BottomNavBarState());
  }
}
