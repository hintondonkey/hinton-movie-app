import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/utils/date_time_utility.dart';
import 'package:movie_app/presentation/widgets/image_error_view.dart';
import 'package:movie_app/screens/details/ui_movie_detail.dart';
import 'package:movie_app/screens/home/constants.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        closedBuilder: (context, action) => _buildMovieCard(context),
        openBuilder: (context, action) => UIMovieDetail(
          movie: movie,
        ),
      ),
    );
  }

  Column _buildMovieCard(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [kDefaultShadow],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: movie.image ?? '',
                fit: BoxFit.fill,
                placeholder: (context, url) => const ImageErrorView(),
                errorWidget: (context, url, error) => const ImageErrorView(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
          child: Column(
            children: [
              Text(
                DateTimeUtility.getNameOfDay(movie.showDate ?? ''),
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: kSecondaryColor,
                      fontSize: 35,
                    ),
              ),
              const SizedBox(height: kDefaultPadding / 2),
              Text(
                DateTimeUtility.getNameOfMonth(movie.showDate ?? ''),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
