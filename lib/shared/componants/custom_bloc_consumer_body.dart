import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/componants/news_item.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';

class CustomBlocConsumerBody extends StatelessWidget {
  const CustomBlocConsumerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          List<dynamic> list = BlocProvider.of<AppCubit>(context).newsList;
          return ListView.separated(
            itemBuilder: (context, index) {
              return NewsItem(mapNewsItemData: list[index]);
            },
            separatorBuilder: (contex, index) {
              return const Divider(
                color: Colors.grey,
              );
            },
            itemCount: list.length,
          );
        }
        if (state is BottomNavBarState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
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
