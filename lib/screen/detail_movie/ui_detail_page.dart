import 'package:flutter/material.dart';
import 'package:movie_app/constants/constants.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screen/detail_movie/components/backdrop_rating.dart';
import 'package:movie_app/screen/detail_movie/components/title_duration_and_fab_btn.dart';

class UIDetailsScreen extends StatelessWidget {
  final Movie movie;

  const UIDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackdropAndRating(size: size, movie: movie),
              const SizedBox(height: kDefaultPadding / 2),
              TitleDurationAndFabBtn(movie: movie),
              ..._buildSummary(context),
              _buildListTicket(context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSummary(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding / 2,
          horizontal: kDefaultPadding,
        ),
        child: Text(
          "Plot Summary",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Text(
          movie.plot,
          style: const TextStyle(
            color: Color(0xFF737599),
          ),
        ),
      ),
    ];
  }

  Widget _buildListTicket(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 3; i++)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Friday, Nov 04,2023',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '07:00 PM',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text('Get ticket from out website'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }
}
