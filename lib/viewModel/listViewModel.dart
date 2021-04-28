import 'package:flutter/material.dart';
import 'package:mvvmprac/models/newsArticle.dart';
import 'package:mvvmprac/services/services.dart';
import 'package:mvvmprac/viewModel/viewModel.dart';

enum LoadingStates { Completed, Searching, Empty }

class ListViewModel with ChangeNotifier {
  LoadingStates loading = LoadingStates.Empty;

  List<ViewModel> viewModel = List<ViewModel>();

  //method to fetch the news
  void getTopHeadlines() async {
    List<NewsArticle> _newsArticle = await WebServices().fetchData();
    loading = LoadingStates.Searching;
    notifyListeners();
    this.viewModel = _newsArticle.map((e) => ViewModel(article: e)).toList();
    if (this.viewModel.isEmpty) {
      loading = LoadingStates.Empty;
    } else {
      loading = LoadingStates.Completed;
    }
    notifyListeners();
  }

  void getTopHeadlinesByCountry(String country) async {
    loading = LoadingStates.Searching;
    notifyListeners();
    List<NewsArticle> _newsArticle =
        await WebServices().fetchDataByCountry(country);

    this.viewModel = _newsArticle.map((e) => ViewModel(article: e)).toList();
    if (this.viewModel.isEmpty) {
      loading = LoadingStates.Empty;
    } else {
      loading = LoadingStates.Completed;
    }
    notifyListeners();
  }
}
