import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class MyObserve implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('$change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('$bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('$bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {}

  @override
  void onEvent(Bloc bloc, Object? event) {}

  @override
  void onTransition(Bloc bloc, Transition transition) {}
}
