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
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            Container(
              height: 130,
              width: 130,
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${mapNewsItemData['title']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Text(
                    '${mapNewsItemData['publishedAt']}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
