import 'package:flutter/material.dart';
import 'package:news_app/shared/componants/news_item.dart';

class BusinessBody extends StatelessWidget {
  const BusinessBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: NewsItem(),
    );
  }
}
