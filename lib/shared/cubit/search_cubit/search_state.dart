part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSuccessState extends SearchState {}

final class LoadingState extends SearchState {}

final class FailurState extends SearchState {
  final String err;

  FailurState({required this.err});
}

