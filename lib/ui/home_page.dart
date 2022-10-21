import 'package:flutter/material.dart';
import 'package:news_app/data/model/articles.dart';
import 'package:news_app/ui/detail_page.dart';
import 'package:news_app/data/api/api_service.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<ArticlesResult> _article;

  @override
  void initState() {
    super.initState();
    _article = ApiService().topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: FutureBuilder(
        future: _article,
        builder: ((context, snapshot) {
          var state = snapshot.connectionState;
          if (state != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.articles.length,
                itemBuilder: (context, index) {
                  var article = snapshot.data?.articles[index];
                  return _buildArticleItem(context, article!);
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return const Text('');
            }
          }
        }),
      ),
    );
  }
}

Widget _buildArticleItem(BuildContext context, Article article) {
  return ListTile(
      leading: Hero(
        tag: article.urlToImage!,
        child: Image.network(
          article.urlToImage!,
          width: 100,
        ),
      ),
      title: Text(article.title),
      subtitle: Text(article.author!),
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName, arguments: article);
      });
}
