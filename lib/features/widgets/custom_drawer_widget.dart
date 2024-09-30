import 'package:flutter/material.dart';
import 'package:news_app/core/color_palette.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomDrawerWidget extends StatelessWidget {
  static const int categories=1;
  static const int settings=2;
  // final  void Function() onCategoryChangedClicked;
  Function onCategoryChangedClicked;
  CustomDrawerWidget({super.key, required this.onCategoryChangedClicked});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    return Container(
      width: MediaQuery.of(context).size.width*0.7,
      color: Colors.white,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height*0.2,
            color: ColorPalette.primaryColor,
            child: Text(
              localization.news_app,
              style: const TextStyle(
                fontFamily: "Exo",
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          InkWell(
            onTap: (){
               onCategoryChangedClicked(categories);
            },
            child: Padding(
              padding:  const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.list,size:40),
                  const SizedBox(width: 8,),
                  Text(
                    localization.categories,
                    style: const TextStyle(
                      fontFamily: "Exo",
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              onCategoryChangedClicked(settings);
            },
            child:Padding(
              padding:const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.settings,size:40),
                   const SizedBox(width: 8,),
                   Text(
                    localization.settings,
                    style: const TextStyle(
                      fontFamily: "Exo",
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
