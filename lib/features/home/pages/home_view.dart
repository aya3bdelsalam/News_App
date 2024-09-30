import 'package:flutter/material.dart';
import 'package:news_app/features/search/search_tab.dart';
import 'package:news_app/features/settings/settings_view.dart';
import 'package:news_app/features/widgets/custom_drawer_widget.dart';
import 'package:news_app/features/selected_category/selected_category_view.dart';
import 'package:news_app/features/widgets/category_data.dart';
import 'package:provider/provider.dart';

import '../../../core/config/settings_provider.dart';
import '../../widgets/category_item_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeView extends StatefulWidget {
   const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context)!;
    var provider = Provider.of<SettingsProvider>(context);
    List<CategoryData> categoryList=[
      CategoryData(
          categoryId: "sports",
          categoryName: localization.sports,
          categoryIcon: "assets/icons/sports.png",
          categoryBackgroundColor:const Color(0xFFC91C22),
      ),
      CategoryData(
        categoryId: "general",
        categoryName: localization.politics,
        categoryIcon: "assets/icons/Politics.png",
        categoryBackgroundColor:const Color(0xFF003E90),
      ),
      CategoryData(
        categoryId: "health",
        categoryName: localization.health,
        categoryIcon: "assets/icons/health.png",
        categoryBackgroundColor:const Color(0xFFED1E79),
      ),
      CategoryData(
        categoryId: "business",
        categoryName: localization.business,
        categoryIcon: "assets/icons/bussines.png",
        categoryBackgroundColor:const Color(0xFFCF7E48),
      ),
      CategoryData(
        categoryId: "environment",
        categoryName: localization.environment,
        categoryIcon: "assets/icons/environment.png",
        categoryBackgroundColor:const Color(0xFF4882CF),
      ),
      CategoryData(
        categoryId: "science",
        categoryName: localization.science,
        categoryIcon: "assets/icons/science.png",
        categoryBackgroundColor:const Color(0xFFF2D352),
      ),
    ];
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/splash.png"),
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
         title:  Text(
             selectedSideMenuItem==CustomDrawerWidget.settings?
                 localization.settings
             :
              selectCategoryData== null
             ? localization.news_app
             :selectCategoryData!.categoryName
         ),
          actions: [
            if(selectCategoryData !=null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: IconButton(onPressed: (){
                  showSearch(context: context, delegate: SearchTab());
                },
                    icon:const Icon(
                        Icons.search_rounded,
                        size: 40,
                        color: Colors.white,
                    )
                ),
              )
          ],
        ),
        drawer: CustomDrawerWidget(
          onCategoryChangedClicked: onCategoryChangedClicked,
        ),
        body: selectedSideMenuItem==CustomDrawerWidget.settings?
            SettingsView()
        :
        selectCategoryData==null ? Padding(
          padding: EdgeInsets.all(20.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(localization.choose,
              style: const TextStyle(
                color: Color(0xFF4F5A69),
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: "Exo",
                height: 1.5
              ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(
                    top:20,right: 15,left:15,
                  ),
                    itemBuilder: (context,index)=> CategoryItemWidget(
                      index: index,
                      categoryData:categoryList[index],
                      onCategoryClicked: onCategoryClicked,
                    ),
                    itemCount: categoryList.length,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.90
                    )
                ),
              )


            ],
          ),
        )
            : SelectedCategoryView(
            categoryData: selectCategoryData!),
      ),
    );
  }

  CategoryData? selectCategoryData;

  void onCategoryClicked(CategoryData categoryData){
      setState((){
        selectCategoryData=categoryData;
      });
  }
  int selectedSideMenuItem=CustomDrawerWidget.categories;
  void onCategoryChangedClicked(int newSideMenuItem){
    setState((){
      selectedSideMenuItem=newSideMenuItem;
      selectCategoryData=null;
      Navigator.pop(context);
    });
  }
}
