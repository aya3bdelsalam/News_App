import 'package:flutter/material.dart';

import 'category_data.dart';

class CategoryItemWidget extends StatelessWidget {
  final int index;
  final CategoryData  categoryData;
  final void Function(CategoryData) onCategoryClicked;
  const CategoryItemWidget({super.key,
    required this.categoryData,
    required this.index,
    required this.onCategoryClicked});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {
        onCategoryClicked(categoryData);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: categoryData.categoryBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(30),
            topRight: const Radius.circular(30),
            bottomLeft: index%2==0
                ? const Radius.circular(30)
                : const Radius.circular(0),
            bottomRight: index%2==0
                ? const Radius.circular(0)
                : const Radius.circular(30),
          )
        ),
        child: Column(
          children: [
            Expanded(child: Image.asset(categoryData.categoryIcon)
            ),
            Text(categoryData.categoryName,
            style:const TextStyle(
              fontFamily: "Exo",
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            )
            )
          ],
        ),
      ),
    );
  }
}
