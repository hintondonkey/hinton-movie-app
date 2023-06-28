import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/base/index.dart';
import 'package:movie_app/presentation/utils/index.dart';
import 'package:movie_app/presentation/widgets/index.dart';
import 'package:movie_app/presentation/widgets/progress_hud.dart';

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

  int _initPosition = 0;

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
      var page = SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xFFF3F3F3),
            body: Center(
              child: CustomTabView(
                initPosition: _initPosition,
                itemCount: state.subCategories?.length ?? 0,
                tabBuilder: (context, index) =>
                    Tab(text: state.subCategories?[index].name ?? ''),
                pageBuilder: (context, index) {
                  return const Center(child: _BuildListEventView());
                },
                onPositionChange: (index) {
                  _initPosition = index;
                },
                onScroll: (position) {},
              ),
            )),
      );

      return ProgressHud(
        inAsyncCall: state.loadingStatus == LoadingStatus.loading,
        progressIndicator: const LoadingView(),
        child: page,
      );
    });
  }
}

class _BuildListEventView extends StatelessWidget {
  const _BuildListEventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 33,),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 30,
            shrinkWrap: true,
            itemBuilder: (ctx, idx) {
              return EventItemView(onTap: () {});
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 41,
              );
            },
          ),
          const SizedBox(height: 33,),

        ],
      ),
    );
  }
}
