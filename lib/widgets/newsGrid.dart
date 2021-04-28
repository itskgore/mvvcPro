import 'package:flutter/material.dart';
import 'package:mvvmprac/screens/detailScreen.dart';
import 'package:mvvmprac/viewModel/viewModel.dart';
import 'package:mvvmprac/widgets/circleImage.dart';

class NewsGrid extends StatelessWidget {
  List<ViewModel> articles;
  NewsGrid({this.articles});

  void _ShowNewsDetailPage(BuildContext context, ViewModel vm) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return DetailScreen(vm);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) {
        var article = articles[index];

        return GestureDetector(
          onTap: () {
            _ShowNewsDetailPage(context, article);
          },
          child: GridTile(
            child: Container(
              child: CircleImage(imageUrl: article.imageToUrl),
            ),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
      itemCount: articles.length,
    );
  }
}
