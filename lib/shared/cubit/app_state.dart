part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

final class BottomNavBarState extends AppState {}

final class DioGetSuccessState extends AppState {}

final class DioLoadingState extends AppState {}

final class DioFailurState extends AppState {
  final String err;

  DioFailurState({required this.err});
}
