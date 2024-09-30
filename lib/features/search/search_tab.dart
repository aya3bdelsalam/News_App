import 'package:flutter/material.dart';

import '../../core/color_palette.dart';
import '../../data/data_source/api_manager.dart';
import '../../model/articles_model.dart';
import '../widgets/article_item_widget.dart';

class SearchTab extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // showResults(context);
    return [
      IconButton(
          onPressed: (){
            query="";
            showSuggestions(context);
          },
          icon: Icon(Icons.clear)
      ),
      IconButton(
          onPressed: (){
            showResults(context);
          },
          icon: Icon(Icons.search)
      ),


    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Article>>(
        future: ApiManager.fetchArticlesList(
            query: query,),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error fetching",
              textAlign: TextAlign.center,
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorPalette.primaryColor,
              ),
            );
          }
          List<Article> articlesList = snapshot.data ?? [];
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ArticleItemWidget(
                article: articlesList[index],
              ),
              itemCount: articlesList.length,
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty){
      return Center(
        child: Text('Please enter a search query'),
      );
    }
    return FutureBuilder<List<Article>>(
        future: ApiManager.fetchArticlesList(
          query: query,),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error fetching",textAlign: TextAlign.center,);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorPalette.primaryColor,
              ),
            );
          }
          List<Article> articlesList = snapshot.data ?? [];
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ArticleItemWidget(
                article: articlesList[index],
              ),
              itemCount: articlesList.length,
            ),
          );
        });
  }

}