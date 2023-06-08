import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/base/index.dart';
import 'package:movie_app/presentation/resources/index.dart';
import 'package:movie_app/presentation/styles/index.dart';
import 'package:movie_app/presentation/utils/index.dart';
import 'package:movie_app/presentation/widgets/index.dart';
import 'package:movie_app/presentation/widgets/no_data_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class HomePage extends BasePage {
  const HomePage({required PageTag pageTag, Key? key})
      : super(tag: pageTag, key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends BasePageState<HomeBloc, HomePage, HomeRouter> {
  StreamSubscription? _subscription;
  final RefreshController _refreshController = RefreshController();

  @override
  void stateListenerHandler(BaseState state) async {
    super.stateListenerHandler(state);
  }

  @override
  void initState() {
    super.initState();
    PushNotificationHandler.shared.setupPushNotification();

  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
    _refreshController.dispose();
  }

  @override
  Widget buildLayout(BuildContext context, BaseBloc bloc) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (ctx, state) {
      return Scaffold(
        backgroundColor: AppColors.primaryBgrColor,
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: state.loadingStatus != LoadingStatus.loading,
          onRefresh: _onRefresh,
          child: state.loadingStatus == LoadingStatus.loading &&
                  state.movies?.isNotEmpty != true
              ? const Center(
                  child: ShimmerItemWidget(),
                )
              : _buildBody(state: state),
        ),
      );
    });
  }

  _buildBody({required HomeState state}) {
    return state.movies?.isNotEmpty == true
        ? SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 46,
                ),
                ListView.separated(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.movies?.length ?? 0,
                  itemBuilder: (ctx, idx) {
                    var model = state.movies![idx];
                    return MovieItemWidget(
                      movieModel: model,
                      onTap: () {
                        router.onNavigateByEvent(
                            context: context,
                            event: NavigateToMovieDetailScreenEvent(
                              movieId: model.id ?? -1,
                              title: model.title ?? '',
                            ));
                      },
                    );
                  },
                  separatorBuilder: (ctx, idx) {
                    return const SizedBox(
                      height: 61,
                    );
                  },
                ),
                const SizedBox(
                  height: 46,
                ),
              ],
            ),
          )
        : const NoDataWidget();
  }

  void _onRefresh() {
    bloc.dispatchEvent(FetchMoviesEvent());
    _refreshController.refreshCompleted();
  }
}
