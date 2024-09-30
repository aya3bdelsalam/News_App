import 'package:flutter/material.dart';
import 'package:news_app/core/color_palette.dart';
import 'package:news_app/data/data_source/api_manager.dart';
import 'package:news_app/features/widgets/category_view_details_widget.dart';
import 'package:news_app/features/widgets/category_data.dart';

import '../../model/sources_model.dart';

class SelectedCategoryView extends StatelessWidget {
  final CategoryData categoryData;
  const SelectedCategoryView({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.fetchSourcesList(categoryData.categoryId),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return const Text(
                "Error fetching"
            );
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color:ColorPalette.primaryColor,
              ),
            );
          }
          List<Source> sourcesList = snapshot.data ?? [];
          return CategoryViewDetailsWidget(sourcesList: sourcesList);
        }
    );
  }
}
