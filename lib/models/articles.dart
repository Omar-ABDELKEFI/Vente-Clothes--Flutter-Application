import 'dart:convert';

import 'article.dart';

Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));

String articlesToJson(Articles data) => json.encode(data.toJson());

class Articles {
  String status;
  int totalResults;
  List<Article> articles;

  Articles({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}


