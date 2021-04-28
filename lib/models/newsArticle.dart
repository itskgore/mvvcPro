class NewsArticle {
  final String title;
  final String pubAt;
  final String descp;
  final String url;
  final String image;

  NewsArticle({this.title, this.pubAt, this.descp, this.url, this.image});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
        title: json['title'],
        descp: json['description'],
        image: json['urlToImage'],
        url: json['url'],
        pubAt: json['publishedAt']);
  }
}
