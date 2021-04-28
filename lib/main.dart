import 'package:flutter/material.dart';
import 'package:mvvmprac/screens/mainScreen.dart';
import 'package:mvvmprac/viewModel/listViewModel.dart';
import 'package:mvvmprac/viewModel/viewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider.value(value: ListViewModel()),
      ], child: NewsScreen()),
    );
  }
}
