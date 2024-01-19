import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/componants/list_news_item_view.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';

class BusinessBody extends StatelessWidget {
  const BusinessBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<dynamic> list = BlocProvider.of<AppCubit>(context).newsList;
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is DioFailurState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.err),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is DioLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is DioGetSuccessState) {
          return ListNewsItemView(list: list);
        }
        return const Center(
          child: Column(
            children: [
              Text(
                'Somthing went wrong',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Please try again later',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        );
      },
    );
  }
}
