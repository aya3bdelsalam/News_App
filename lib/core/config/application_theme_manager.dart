import 'package:flutter/material.dart';

import '../color_palette.dart';

class ApplicationThemeManager{
  static ThemeData themeData=ThemeData(
    primaryColor: ColorPalette.primaryColor,
    appBarTheme:AppBarTheme(
      backgroundColor: ColorPalette.primaryColor,
      centerTitle: true,
      titleTextStyle:const TextStyle(
        fontFamily: "Exo",
        fontSize: 22,
      ),
      shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )
      ),
      iconTheme:const  IconThemeData(
          color: Colors.white,
          size: 30
      ),
    ),

  );
}