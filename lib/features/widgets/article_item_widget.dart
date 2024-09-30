import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/page_route_names.dart';
import 'package:news_app/features/article_details/article_details.dart';
import 'package:news_app/model/articles_model.dart';

class ArticleItemWidget extends StatelessWidget {
  final Article article;
  const ArticleItemWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, PageRouteNames.articleDetails,arguments: article);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 230,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child:CachedNetworkImage(
                imageUrl: article.urlToImage,
                imageBuilder: (context,imageProvider){
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image:DecorationImage(
                        image: imageProvider,
                        fit:BoxFit.cover
                      )

                    ),
                  );
                },
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.grey,
                  size: 45,
                ),
              ),
            ),
            const SizedBox(height: 8,),
            Text(
              article.author,
              textAlign: TextAlign.start,
              style:const TextStyle(
                  fontFamily: "Exo",
                  fontSize: 10,
                  color: Color(0xFF79828B)
              ),
            ),
            const SizedBox(height: 4,),
            Text(
              article.title,
              textAlign: TextAlign.start,
              style:const TextStyle(
                  fontFamily: "Exo",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF42505C)
              ),
            ),
            const SizedBox(height: 4,),
            Text(
              article.publishedAt.substring(0,10),
              textAlign: TextAlign.end,
              style:const TextStyle(
                  fontFamily: "Exo",
                  fontSize: 13,
                  color: Color(0xFFA3A3A3)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
