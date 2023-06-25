import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/presentation/base/index.dart';
import 'package:movie_app/presentation/page/about_us/index.dart';
import 'package:movie_app/presentation/page/event/index.dart';
import 'package:movie_app/presentation/page/news/index.dart';
import 'package:movie_app/presentation/page/sport/index.dart';
import 'package:movie_app/presentation/resources/index.dart';
import 'package:movie_app/presentation/styles/index.dart';
import 'package:movie_app/presentation/utils/index.dart';

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
      return SafeArea(
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
                fontSize: 8, fontWeight: FontWeight.w700, color: Colors.white),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SvgPicture.asset(
                    AppImages.icBottomBarEvent,
                    color: Colors.white,
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SvgPicture.asset(AppImages.icBottomBarEvent),
                ),
                label: AppLocalizations.shared.bottomBarEvent,
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SvgPicture.asset(AppImages.icBottomBarNews),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SvgPicture.asset(
                    AppImages.icBottomBarNews,
                    color: AppColors.secondaryColor,
                  ),
                ),
                label: AppLocalizations.shared.bottomBarNews,
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Image.asset(AppImages.icBottomBarSportPng),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Image.asset(
                    AppImages.icBottomBarSportPng,
                    color: AppColors.secondaryColor,
                  ),
                ),
                label: AppLocalizations.shared.bottomBarSports,
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SvgPicture.asset(AppImages.icBottomBarAboutUs),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: SvgPicture.asset(
                    AppImages.icBottomBarAboutUs,
                    color: AppColors.secondaryColor,
                  ),
                ),
                label: AppLocalizations.shared.bottomBarAboutUs,
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: AppColors.secondaryColor,
                  width: double.maxFinite,
                  height: 100,
                  padding: const EdgeInsets.only(left: 24),
                  alignment: Alignment.centerLeft,
                  child:Image.asset(AppImages.icAppLogoPng),
                ),
                Expanded(
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: const [
                      EventPage(pageTag: PageTag.event),
                      NewsPage(pageTag: PageTag.news),
                      SportPage(pageTag: PageTag.sport),
                      AboutUsPage(pageTag: PageTag.aboutUs),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
