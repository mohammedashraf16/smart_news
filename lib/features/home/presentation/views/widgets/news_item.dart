import 'package:flutter/material.dart';
import 'package:news_app/features/home/data/models/NewsDataResponse.dart';
import 'package:news_app/features/home/presentation/views/widgets/news_details.dart';

class NewsItem extends StatelessWidget {
  Articles article;

  NewsItem({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetails.routeName,arguments: article);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                article.urlToImage ?? "",
              ),
            ),
            const SizedBox(height: 5),
            Text(
              article.source?.name ?? "",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              article.title ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              maxLines: 4,
              article.description ?? "",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.grey),
            ),
            Text(
              article.publishedAt?.substring(0, 10) ?? "",
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.green,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
