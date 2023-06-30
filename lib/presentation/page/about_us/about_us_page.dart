import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/presentation/base/index.dart';
import 'package:movie_app/presentation/resources/index.dart';
import 'package:movie_app/presentation/styles/index.dart';
import 'package:movie_app/presentation/utils/index.dart';

import 'index.dart';

class AboutUsPage extends BasePage {
  const AboutUsPage({required PageTag pageTag, Key? key})
      : super(tag: pageTag, key: key);

  @override
  State<StatefulWidget> createState() => AboutUsPageState();
}

class AboutUsPageState
    extends BasePageState<AboutUsBloc, AboutUsPage, AboutUsRouter> {
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
    return BlocBuilder<AboutUsBloc, AboutUsState>(builder: (ctx, state) {
      return const SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 33,
                ),
                _BuildAppLogoWidget(url: AppImages.icPathLogoPng),
                SizedBox(
                  height: 63,
                ),
                _BuildMissionWidget(
                    title: 'Mission:',
                    content:
                        '''“Our Mission is to operate a facility where Performers,
Musicians and Artists can foster a creative environment
committed to the perpetual learning and entertainment of our community” - Ash'''),
                SizedBox(
                  height: 36,
                ),
                _BuildUserGroupWidget(title: 'User group:'),
                SizedBox(
                  height: 36,
                ),
                _BuildLocationWidget(
                  title: 'Location',
                  content:
                      '''West Fraser Guild - 821 Switzer Drive Hinton, AB T7V 1V1''',
                ),
                SizedBox(
                  height: 36,
                ),
                _BuildContactWidget(
                  title: 'Email',
                  email: 'info@pathinton.ca',
                  phone: '(780) 223-2787',
                ),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class _BuildAppLogoWidget extends StatelessWidget {
  const _BuildAppLogoWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 112,
          height: 112,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: const BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Image.asset(url)),
    );
  }
}

class _BuildMissionWidget extends StatelessWidget {
  const _BuildMissionWidget({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleMedium.copyWith(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            content,
            style: titleMedium.copyWith(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 11),
          ),
        ],
      ),
    );
  }
}

class _BuildUserGroupWidget extends StatefulWidget {
  const _BuildUserGroupWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<_BuildUserGroupWidget> createState() => _BuildUserGroupWidgetState();
}

class _BuildUserGroupWidgetState extends State<_BuildUserGroupWidget> {
  List<String> list = [
    'BREAK-A-LEG THEATRE',
    'C.A.S.T SUMMER THEATRE',
    'FOOTHILLS MALE CHORUS',
    'HINOTN FILM CLUB',
    'HINTON MOVIES',
    'HINTON PERFORMANCE ART SOCIETY',
    'SPIRITS OF ROCKIES',
    'YRAF',
    'SPECIALIZED BOOKING FORM*'
  ];

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: titleMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
              ),
              InkResponse(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: SvgPicture.asset(
                    !_isExpanded ? AppImages.icExpand : AppImages.icColapse),
              )
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, idx) {
                return _BuildItemInGroupWidget(title: list[idx], onTap: () {});
              },
              separatorBuilder: (ctx, idx) {
                return const SizedBox(
                  height: 16,
                );
              },
              itemCount: _isExpanded
                  ? list.length
                  : (list.length > 3 ? 3 : list.length)),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}

class _BuildItemInGroupWidget extends StatelessWidget {
  const _BuildItemInGroupWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        height: 46,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: Color(0xFF2C39A9),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            title,
            style: titleMedium.copyWith(
                fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _BuildLocationWidget extends StatelessWidget {
  const _BuildLocationWidget({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleMedium.copyWith(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),
          ),
          const SizedBox(
            height: 16,
          ),
          _BuildRowItemWidget(
            content: content,
            image: AppImages.icLocation,
          )
        ],
      ),
    );
  }
}

class _BuildContactWidget extends StatelessWidget {
  const _BuildContactWidget({
    Key? key,
    required this.email,
    required this.phone,
    required this.title,
  }) : super(key: key);
  final String email;
  final String phone;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleMedium.copyWith(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),
          ),
          const SizedBox(
            height: 16,
          ),
          _BuildRowItemWidget(
            content: email,
            image: AppImages.icMail,
          ),
          const SizedBox(
            height: 13,
          ),
          _BuildRowItemWidget(
            content: phone,
            image: AppImages.icPhone,
          ),
        ],
      ),
    );
  }
}

class _BuildRowItemWidget extends StatelessWidget {
  const _BuildRowItemWidget({
    Key? key,
    required this.content,
    required this.image,
  }) : super(key: key);
  final String image;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(image),
        const SizedBox(
          width: 32,
        ),
        Expanded(
          child: Text(
            content,
            textAlign: TextAlign.start,
            style: titleMedium.copyWith(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 11),
          ),
        ),
      ],
    );
  }
}
