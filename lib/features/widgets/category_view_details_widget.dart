import 'package:flutter/material.dart';
import 'package:news_app/core/color_palette.dart';
import 'package:news_app/data/data_source/api_manager.dart';
import 'package:news_app/features/widgets/article_item_widget.dart';
import 'package:news_app/features/widgets/tab_item_widget.dart';
import 'package:news_app/model/articles_model.dart';
import 'package:news_app/model/sources_model.dart';

class CategoryViewDetailsWidget extends StatefulWidget {
  final List<Source> sourcesList;
  const CategoryViewDetailsWidget({super.key, required this.sourcesList});

  @override
  State<CategoryViewDetailsWidget> createState() =>
      _CategoryViewDetailsWidgetState();
}

class _CategoryViewDetailsWidgetState extends State<CategoryViewDetailsWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sourcesList.length,
            child: TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorPadding: EdgeInsets.zero,
              indicator: const BoxDecoration(),
              labelPadding: const EdgeInsets.symmetric(horizontal: 6),
              padding: const EdgeInsets.symmetric(vertical: 10),
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              tabs: widget.sourcesList
                  .map((source) => TabItemWidget(
                        source: source,
                        isSelected:
                            selectedIndex == widget.sourcesList.indexOf(source),
                      ))
                  .toList(),
            )),
        FutureBuilder<List<Article>>(
            future: ApiManager.fetchArticlesList(
                 sourceID: widget.sourcesList[selectedIndex].id),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Error fetching");
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
            })
      ],
    );
  }
}
