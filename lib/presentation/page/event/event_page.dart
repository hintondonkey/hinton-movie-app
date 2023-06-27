import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/base/index.dart';
import 'package:movie_app/presentation/utils/index.dart';

import 'index.dart';

class EventPage extends BasePage {
  const EventPage({
    required PageTag pageTag,
    Key? key,
    required this.categoryId,
  }) : super(tag: pageTag, key: key);

  final int categoryId;

  @override
  State<StatefulWidget> createState() => EventPageState();
}

class EventPageState extends BasePageState<EventBloc, EventPage, EventRouter> {
  StreamSubscription? _subscription;

  @override
  void stateListenerHandler(BaseState state) async {
    super.stateListenerHandler(state);
  }

  @override
  void initState() {
    super.initState();
    bloc.dispatchEvent(FetchSubCategoriesEvent(
        param: FetchSubCategoriesParam(categoryId: widget.categoryId)));
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  @override
  Widget buildLayout(BuildContext context, BaseBloc bloc) {
    return BlocBuilder<EventBloc, EventState>(builder: (ctx, state) {
      return const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text("Event Page"),
          ),
        ),
      );
    });
  }
}
