part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

final class BottomNavBarState extends AppState {}

final class ChangeSystemThemeState extends AppState {}

final class GetSuccessState extends AppState {}

final class LoadingState extends AppState {}

final class FailurState extends AppState {
  final String err;

  FailurState({required this.err});
}
