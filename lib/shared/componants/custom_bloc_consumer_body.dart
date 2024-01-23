import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/componants/custom_snack_bar.dart';
import 'package:news_app/shared/componants/news_item.dart';
import 'package:news_app/shared/cubit/app_cupit/app_cubit.dart';

class CustomBlocConsumerBody extends StatelessWidget {
  const CustomBlocConsumerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is FailurState) {
          customSnakBar(context, text: state.err);
        }
      },
      builder: (context, state) {
        if (state is LoadingState || state is BottomNavBarState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GetSuccessState || state is ChangeSystemThemeState) {
          List<dynamic> list = BlocProvider.of<AppCubit>(context).newsList;
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
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
        return const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
