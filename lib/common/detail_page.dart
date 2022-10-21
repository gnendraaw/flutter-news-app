import 'package:flutter/material.dart';
import 'package:news_app/data/model/articles.dart';
import 'package:news_app/common/web_detail_page.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final Article article;

  const DetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: article.urlToImage,
              child: Image.network(
                article.urlToImage,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.description),
                  const Divider(color: Colors.grey),
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    article.content,
                  ),
                  const Divider(color: Colors.grey),
                  ElevatedButton(
                    child: const Text('Read More'),
                    onPressed: () {
                      Navigator.pushNamed(context, WebDetailPage.routeName,
                          arguments: article.url);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
