import 'package:flutter/material.dart';
import 'package:news_app/ui/home_page.dart';
import 'package:news_app/ui/detail_page.dart';
import 'package:news_app/data/model/articles.dart';
import 'package:news_app/ui/web_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          DetailPage.routeName: (context) => DetailPage(
                article: ModalRoute.of(context)?.settings.arguments as Article,
              ),
          WebDetailPage.routeName: (context) => WebDetailPage(
              url: ModalRoute.of(context)?.settings.arguments as String),
        });
  }
}
