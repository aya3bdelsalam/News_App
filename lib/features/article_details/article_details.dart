import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/articles_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/color_palette.dart';

class ArticleDetails extends StatelessWidget {
  // Article article;
  const ArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var article=ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      appBar: AppBar(
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
        title:  Text(
            "News Details"
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 270,
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
            const SizedBox(height: 10,),
            Text(
              article.content,
              textAlign: TextAlign.start,
              style:const TextStyle(
                  fontFamily: "Exo",
                  fontSize: 13,
                  color: Color(0xFF42505C),
                  height: 1.5
              ),
            ),
            // const SizedBox(height: 50,),
            Spacer(),
            InkWell(
              onTap: (){
                _launchUrl(article.url);
              },
              child:const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "View Full Article",
                    textAlign: TextAlign.start,
                    style:const TextStyle(
                        fontFamily: "Exo",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF42505C),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
            const SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
