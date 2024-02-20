import 'package:flutter/material.dart';
import 'package:untitled1/models/articles.dart';
import 'package:untitled1/services/news_services.dart';

class Newspage extends StatefulWidget {
  const Newspage({super.key});

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  NewsService newsService = NewsService();
  Articles? articles;

  @override
  void initState() {
    // TODO: implement initState
    newsService.getAll().then((value) {
      setState(() {
        articles = value;
      });
      print("Data Loaded");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Build UI");
    return Scaffold(
      appBar: AppBar(
        title: Text("News Page"),
      ),
      body: ListView(
        children: articles?.articles
                .map((article) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(article.publishedAt.toIso8601String()),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey.shade300,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      article.urlToImage,
                                      height: 100,
                                      width: 100,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          article.title,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        Text(
                                          article.description,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ))
                .toList() ??
            [],
      ),
    );
  }
}
