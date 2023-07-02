import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/data/remote/api/api_config.dart';
import 'package:movie_app/domain/model/category/index.dart';
import 'package:movie_app/presentation/base/index.dart';
import 'package:movie_app/presentation/page/about_us/index.dart';
import 'package:movie_app/presentation/page/event/index.dart';
import 'package:movie_app/presentation/page/home/index.dart';
import 'package:movie_app/presentation/page/news/index.dart';
import 'package:movie_app/presentation/resources/index.dart';
import 'package:movie_app/presentation/styles/index.dart';
import 'package:movie_app/presentation/utils/index.dart';
import 'package:movie_app/presentation/widgets/index.dart';
import 'package:collection/collection.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class MainPage extends BasePage {
  const MainPage({required PageTag pageTag, Key? key})
      : super(tag: pageTag, key: key);

  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends BasePageState<MainBloc, MainPage, MainRouter> {
  StreamSubscription? _subscription;
  StreamSubscription? notiSubscription;
  final RefreshController _refreshController = RefreshController();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void stateListenerHandler(BaseState state) async {
    super.stateListenerHandler(state);
  }

  @override
  void initState() {
    super.initState();
    PushNotificationHandler.shared.setupPushNotification();
    _checkOpenAppFromNotification();
  }

  _checkOpenAppFromNotification() async {
    notiSubscription?.cancel();
    notiSubscription =
        PushNotificationHandler.shared.notificationEventStream.listen((event) {
      if (event is NotificationTapEvent) {
        if (event.notification.movieId != null) {
          router.onNavigateByEvent(
              context: context,
              event: NavigateToMovieDetailScreenEvent(
                movieId: event.notification.movieId ?? -1,
                title: '',
              ));
        }
      }
    });

    final initEvent = await PushNotificationHandler.shared.getInitialEvent();
    if (initEvent != null) {
      if (initEvent.notification.movieId != null) {
        if (mounted) {
          router.onNavigateByEvent(
              context: context,
              event: NavigateToMovieDetailScreenEvent(
                movieId: initEvent.notification.movieId ?? -1,
                title: '',
              ));
        }
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
    notiSubscription?.cancel();
  }

  void _onRefresh() {
    bloc.dispatchEvent(
        FetchCategoriesEvent(param: FetchCategoriesParam(brokerId: kBrokerId)));
    _refreshController.refreshCompleted();
  }

  @override
  Widget buildLayout(BuildContext context, BaseBloc bloc) {
    return BlocBuilder<MainBloc, MainState>(builder: (ctx, state) {
      return state.loadingStatus == LoadingStatus.loading
          ? const ShimmerHomeWidget()
          : SmartRefresher(
              controller: _refreshController,
              enablePullUp: false,
              enablePullDown: true,
              onRefresh: _onRefresh,
              child: SafeArea(
                child: Scaffold(
                  bottomNavigationBar: BottomNavigationBar(
                    backgroundColor: const Color(0xFFC2C1C1),
                    type: BottomNavigationBarType.fixed,
                    unselectedItemColor: Colors.white,
                    selectedItemColor: AppColors.secondaryColor,
                    selectedLabelStyle: titleMedium.copyWith(
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondaryColor),
                    unselectedLabelStyle: titleMedium.copyWith(
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    items: state.categories
                            ?.map((e) => BottomNavigationBarItem(
                                  icon: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: SvgPicture.asset(
                                      e.icon ?? '',
                                      color: Colors.white,
                                    ),
                                  ),
                                  activeIcon: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: SvgPicture.asset(
                                      e.icon ?? '',
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                  label: e.name ?? '',
                                ))
                            .toList() ??
                        [
                          BottomNavigationBarItem(
                              label: 'About Us',
                              icon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: SvgPicture.asset(
                                  AppImages.icBottomBarAboutUs,
                                  color: Colors.white,
                                ),
                              )),
                          BottomNavigationBarItem(
                              label: 'About Us',
                              icon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: SvgPicture.asset(
                                  AppImages.icBottomBarAboutUs,
                                  color: Colors.white,
                                ),
                              )),
                        ],
                    currentIndex: _selectedIndex,
                    onTap: _onItemTapped,
                  ),
                  body: Center(
                    child: IndexedStack(
                      index: _selectedIndex,
                      children: state.categories?.mapIndexed((index, element) {
                            if (index == (state.categories?.length ?? 0) - 1) {
                              return const AboutUsPage(
                                  pageTag: PageTag.aboutUs);
                            }
                            return EventPage(
                                pageTag: PageTag.event,
                                categoryId: state.categories?[index].id ?? -1);
                          }).toList() ??
                          [const SizedBox(), const SizedBox()],
                    ),
                  ),
                ),
              ),
            );
    });
  }
}
