

class ArticlesModel{
  final String status;
  final List<Article> articles;

  ArticlesModel({
    required this.status,
    required this.articles,

});
  factory ArticlesModel.fromJson(Map<String, dynamic> json){
    return ArticlesModel(
      status: json['status'],
      articles: List.from(json['articles']).map((element) => Article.fromJson(element)).toList(),
    );
  }
}
class Article{
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article( {
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.author,
    required this.title,
    required this.content,

});
  factory Article.fromJson(Map<String, dynamic> json){
    return Article(
      author: json['source']['name'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }

}