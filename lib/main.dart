import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/ui/screen/homepage/home_page.dart';

import 'observer.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  runApp(
    const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pageNum = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hinton Movie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageScreen(),
    );
  }
}
