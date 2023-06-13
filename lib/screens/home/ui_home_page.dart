import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/screens/home/constants.dart';
import 'package:movie_app/screens/home/movie_card.dart';

class UIHomePage extends StatelessWidget {
  const UIHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: MovieCarousel(),
          ),
        ],
      ),
    );
  }
}

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key});

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late PageController _pageController;
  late List<MovieModel> movies = [];
  int initialPage = 1;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      // so that we can have small portion shown on left and right side
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    movies = await loadJsonData();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Future<List<MovieModel>> loadJsonData() async {
    try {
      String jsonData =
          await rootBundle.loadString('assets/jsons/faker_data.json');
      final parsed = jsonDecode(jsonData).cast<Map<String, dynamic>>();
      return parsed
          .map<MovieModel>((json) => MovieModel.fromJson(json))
          .toList();
    } catch (error) {
      print('Error: ${error}');
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding * 3),
      child: AspectRatio(
        aspectRatio: 0.7,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              initialPage = value;
            });
          },
          controller: _pageController,
          physics: const ClampingScrollPhysics(),
          itemCount: movies.length,
          itemBuilder: (context, index) => _buildMovieSlider(index),
        ),
      ),
    );
  }

  Widget _buildMovieSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            if (_pageController.page != null) {
              value = index - _pageController.page!;
              // We use 0.038 because 180*0.038 = 7 almost and we need to rotate our poster 7 degree
              // we use clamp so that our value vary from -1 to 1
              value = (value * 0.038).clamp(-1, 1);
            }
          }
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0.4,
            child: Transform.rotate(
              angle: math.pi * value,
              child: MovieCard(
                movie: movies[index],
              ),
            ),
          );
        },
      );
}
