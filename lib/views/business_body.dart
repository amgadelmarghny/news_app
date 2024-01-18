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
      listener: (context, state) {},
      builder: (context, state) {
        return ListNewsItemView(list: list);
      },
    );
  }
}
