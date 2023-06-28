import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/domain/enum/index.dart';
import 'package:movie_app/presentation/base/index.dart';
import 'package:movie_app/presentation/page/about_us/index.dart';
import 'package:movie_app/presentation/page/event/index.dart';
import 'package:movie_app/presentation/page/news/index.dart';
import 'package:movie_app/presentation/page/sport/index.dart';
import 'package:movie_app/presentation/resources/index.dart';
import 'package:movie_app/presentation/styles/index.dart';
import 'package:movie_app/presentation/utils/index.dart';
import 'package:movie_app/presentation/widgets/index.dart';
import 'package:collection/collection.dart';

import 'index.dart';

class MainPage extends BasePage {
  const MainPage({required PageTag pageTag, Key? key})
      : super(tag: pageTag, key: key);

  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends BasePageState<MainBloc, MainPage, MainRouter> {
  StreamSubscription? _subscription;

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
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  @override
  Widget buildLayout(BuildContext context, BaseBloc bloc) {
    return BlocBuilder<MainBloc, MainState>(builder: (ctx, state) {
      return state.loadingStatus == LoadingStatus.loading
          ? const ShimmerHomeWidget()
          : SafeArea(
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
                                    e.image ?? '',
                                    color: Colors.white,
                                  ),
                                ),
                                activeIcon: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: SvgPicture.asset(
                                    e.image ?? '',
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
                                label: e.name ?? '',
                              ))
                          .toList() ??
                      [],
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                ),
                body: Center(
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: [
                      if (state.categories?.isNotEmpty == true &&
                          state.categories?.any((element) =>
                                  element.categoryType ==
                                  CategoryType.event) ==
                              true)
                        EventPage(
                          pageTag: PageTag.event,
                          categoryId: state.categories
                                  ?.firstWhereOrNull((element) =>
                                      element.categoryType ==
                                      CategoryType.event)
                                  ?.id ??
                              -1,
                        ),
                      if (state.categories?.isNotEmpty == true &&
                          state.categories?.any((element) =>
                                  element.categoryType ==
                                  CategoryType.news) ==
                              true)
                        const NewsPage(pageTag: PageTag.news),
                      if (state.categories?.isNotEmpty == true &&
                          state.categories?.any((element) =>
                                  element.categoryType ==
                                  CategoryType.sports) ==
                              true)
                        const SportPage(pageTag: PageTag.sport),
                      if (state.categories?.isNotEmpty == true &&
                          state.categories?.any((element) =>
                                  element.categoryType ==
                                  CategoryType.aboutUs) ==
                              true)
                        const AboutUsPage(pageTag: PageTag.aboutUs),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
