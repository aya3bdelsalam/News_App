import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/articles_model.dart';
import 'package:news_app/model/sources_model.dart';

import '../../core/config/constants.dart';

class ApiManager{
  static Future<List<Source>> fetchSourcesList(String categoryID) async{
    // https://newsapi.org/v2/top-headlines/sources?category=business&apiKey=b54142a66a0e484c9ebec6e019b14ebc
    var url=Uri.https(
      Constants.domain,
      "/v2/top-headlines/sources",
      {
        "apiKey":Constants.apiKey,
        "category":categoryID,
      }
    );
   final response= await http.get(url);
   if(response.statusCode==200){
   //   we got the response object
   //   parsing
     Map<String, dynamic> data=jsonDecode(response.body);
     SourcesModel sourceModel=SourcesModel.fromJson(data);
     return sourceModel.sources;
   }
   else{
     throw Exception("Failed to get sources list..");
   }
  }
  static Future<List<Article>> fetchArticlesList(
      {String? sourceID, String? query}) async{
    // https://newsapi.org/v2/top-headlines/sources?category=business&apiKey=b54142a66a0e484c9ebec6e019b14ebc
    var url=Uri.https(
        Constants.domain,
        "/v2/top-headlines",
        {
          "apiKey":Constants.apiKey,
          "sources":sourceID,
          "q":query,  // if you want to search something
        }
    );
    final response= await http.get(url);
    if(response.statusCode==200){
      //   we got the response object
      //   parsing
      Map<String, dynamic> data=jsonDecode(response.body);
      ArticlesModel articlesModel=ArticlesModel.fromJson(data);
      return articlesModel.articles;
    }
    else{
      throw Exception("Failed to get sources list..");
    }
  }
}