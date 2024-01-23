import 'package:bloc/bloc.dart';
import 'package:news_app/shared/network/remot/dio_helper.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  List<dynamic> searchList = [];
  void searchFor({required String searchTitle}) {
    emit(LoadingState());
    DioHelper.get(url: 'v2/everything', query: {
      "q": searchTitle,
      "apiKey": '65f7f556ec76449fa7dc7c0069f040ca ',
    }).then((value) {
      searchList = value.data['articles'];
      print('valuee :::::::::${value.data['articles']}');
      emit(SearchSuccessState());
    }).catchError((err) {
      emit(FailurState(err: err));
    });
  }
}
