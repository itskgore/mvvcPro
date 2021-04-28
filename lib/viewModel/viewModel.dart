import 'package:intl/intl.dart';
import 'package:mvvmprac/models/newsArticle.dart';

class ViewModel {
  NewsArticle _newsArticle;
  ViewModel({NewsArticle article}) : _newsArticle = article;

  String get title {
    return _newsArticle.title;
  }

  String get imageToUrl {
    return _newsArticle.image;
  }

  String get url {
    return _newsArticle.url;
  }

  String get publishedAt {
    final date =
        DateFormat('yyyy-mm-ddTHH:mm:ssZ').parse(_newsArticle.pubAt, true);
    return DateFormat.yMMMMEEEEd('en-us').format(date);
  }

  String get description {
    return _newsArticle.descp;
  }
}
