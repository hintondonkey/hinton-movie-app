import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/base/index.dart';
import 'package:movie_app/presentation/utils/index.dart';

import 'index.dart';

class NewsPage extends BasePage {
  const NewsPage({required PageTag pageTag, Key? key})
      : super(tag: pageTag, key: key);

  @override
  State<StatefulWidget> createState() => NewsPageState();
}

class NewsPageState extends BasePageState<NewsBloc, NewsPage, NewsRouter> {
  StreamSubscription? _subscription;

  @override
  void stateListenerHandler(BaseState state) async {
    super.stateListenerHandler(state);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  @override
  Widget buildLayout(BuildContext context, BaseBloc bloc) {
    return BlocBuilder<NewsBloc, NewsState>(builder: (ctx, state) {
      return const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text("News Page"),
          ),
        ),
      );
    });
  }
}
