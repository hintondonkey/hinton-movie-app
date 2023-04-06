import 'package:flutter/material.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/ui/screen/homepage/home_page.dart';

void main() async {
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
      home: HomePageScreen(),
    );
  }
}

class ApplicationToolbar extends StatelessWidget with PreferredSizeWidget {
  int pageNum = 0;
  @override
  Widget build(BuildContext context) {
    return pageNum == 0
        ? AppBar(
            backgroundColor: const Color(0xFF464646),
            title: const Text("Hinton Movie"),
          )
        : AppBar(
            backgroundColor: const Color(0xFF464646),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.red,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            // title: const Text("Hinton Movie"),
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
