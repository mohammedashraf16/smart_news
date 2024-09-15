import 'package:flutter/material.dart';
import 'package:news_app/features/home/data/models/NewsDataResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = "newsDetails";

  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          )
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )),
        toolbarHeight: 65,
        backgroundColor: Colors.green,
        title: Text(
          "News Details",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
              ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                article.urlToImage ?? "",
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
              const SizedBox(height: 10),

              Text(
                maxLines: 4,
                article.description ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey),
              ),
              Text(
                maxLines: 4,
                article.content ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Text(
                article.publishedAt?.substring(0, 10) ?? "",
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.green,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  _launchUrl(article.url??"");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                       "View Full Article",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.arrow_right,color: Colors.green,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

}
