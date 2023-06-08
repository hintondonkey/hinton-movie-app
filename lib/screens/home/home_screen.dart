import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsets.only(left: kDefaultPadding),
        icon: SvgPicture.asset(
          "assets/icons/menu.svg",
          height: 20,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/search1.svg",
            height: 20,
          ),
        )
      ],
    );
  }
}
