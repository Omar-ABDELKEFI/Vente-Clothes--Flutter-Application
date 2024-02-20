import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled1/models/articles.dart';

class NewsService{
  Future<Articles ?> getAll() async{
    var response = await http.get(
      Uri(
        scheme:"https",
        host:"newsapi.org",
        path:'v2/top-headlines',
        queryParameters: {
          "sources":"techcrunch",
          "apikey":"d689b3d90b864f2697d18eb72a7ff713",
        }
      )
    );

    if (response.body.isNotEmpty){
      return Articles.fromJson(jsonDecode(response.body));
    }
    return null ;
  }
}