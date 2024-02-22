import 'package:flutter/material.dart';
import 'package:news_app/views/webview.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.mapNewsItemData});
  final Map mapNewsItemData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebviewView(
              url: mapNewsItemData['url'],
            ),
          ),
        );
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.4,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(1, 1),
                color: Colors.grey.withOpacity(0.3),
              )
            ]),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                    mapNewsItemData['urlToImage'] ??
                        'https://thumbs.dreamstime.com/b/word-news-12817653.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '${mapNewsItemData['title']}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${mapNewsItemData['publishedAt']}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
