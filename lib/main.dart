import 'package:flutter/material.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/movie_detail.dart';

void main() {
  runApp(const MyApp());
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
      home: HomePage(),
    );
  }

  Widget buildAppBar() {
    return pageNum == 0
        ? AppBar(
            backgroundColor: Color(0xFF464646),
            title: const Text("Hinton Movie"),
          )
        : AppBar(
            backgroundColor: Color(0xFF464646),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.red,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            // title: const Text("Hinton Movie"),
          );
  }
}

class ApplicationToolbar extends StatelessWidget with PreferredSizeWidget {
  int pageNum = 0;
  @override
  Widget build(BuildContext context) {
    return pageNum == 0
        ? AppBar(
            backgroundColor: Color(0xFF464646),
            title: const Text("Hinton Movie"),
          )
        : AppBar(
            backgroundColor: Color(0xFF464646),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.red,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            // title: const Text("Hinton Movie"),
          );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
