import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/ui/screen/homepage/home_page.dart';

import 'observer.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  final fcmToken = await FirebaseMessaging.instance.getToken();

  // FirebaseMessaging.instance.onTokenRefresh
  //     .listen((fcmToken) {
  //   // TODO: If necessary send token to application server.

  //   // Note: This callback is fired at each app startup and whenever a new
  //   // token is generated.
  // })
  //     .onError((err) {
  //   // Error getting token.
  // });

  // await FirebaseMessaging.instance.setAutoInitEnabled(true);

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
