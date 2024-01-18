
import 'package:flutter/material.dart';
import 'package:news_app/shared/componants/news_item.dart';

class ListNewsItemView extends StatelessWidget {
  const ListNewsItemView({
    super.key,
    required this.list,
  });

  final List list;

  @override
  Widget build(BuildContext context) {
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
}
