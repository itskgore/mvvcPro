import 'package:flutter/material.dart';
import 'package:mvvmprac/const/keys.dart';
import 'package:mvvmprac/viewModel/listViewModel.dart';
import 'package:mvvmprac/widgets/newsGrid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ListViewModel>(context, listen: false).getTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listviewmodel = Provider.of<ListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: Text('News App'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (country) {
                listviewmodel
                    .getTopHeadlinesByCountry(Constants.Countries[country]);
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) {
                return Constants.Countries.keys
                    .map((v) => PopupMenuItem(
                          value: v,
                          child: Text(v),
                        ))
                    .toList();
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 15, top: 15),
                child: Text(
                  'Headlines',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              listviewmodel.loading == LoadingStates.Searching
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: NewsGrid(articles: listviewmodel.viewModel),
                    ),
            ],
          ),
        ));
  }
}
