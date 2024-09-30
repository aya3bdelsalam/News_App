import 'package:flutter/material.dart';
import 'package:news_app/core/color_palette.dart';
import 'package:news_app/model/sources_model.dart';

class TabItemWidget extends StatelessWidget {
  final Source source;
  final bool isSelected;
  const TabItemWidget({super.key, required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
      decoration: BoxDecoration(
        color: isSelected? ColorPalette.primaryColor: Colors.white,

        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color:ColorPalette.primaryColor,
        )
      ),
      child: Text(
        source.name,
        style: TextStyle(
            fontFamily: "Exo",
            fontSize: 14,
            fontWeight: FontWeight.w500,
          color: isSelected? Colors.white: ColorPalette.primaryColor,
        ),
      ),
    );
  }
}
