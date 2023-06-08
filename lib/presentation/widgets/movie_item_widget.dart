import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/styles/index.dart';
import 'package:movie_app/presentation/widgets/index.dart';

class MovieItemWidget extends StatelessWidget {
  const MovieItemWidget({
    Key? key,
    required this.movieModel,
    required this.onTap,
  }) : super(key: key);
  final MovieModel movieModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(46),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: movieModel.image ?? '',
                  placeholder: (context, url) => const ImageErrorView(),
                  errorWidget: (context, url, error) => const ImageErrorView(),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const DotsIndicator(dotsCount: 3),
            const SizedBox(
              height: 18,
            ),
            Text(
              (movieModel.showDate ?? '').formatMovieDate(isList: true)[0],
              style: titleMedium.copyWith(
                  color: const Color(0xFFD41818),
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              (movieModel.showDate ?? '').formatMovieDate(isList: true)[1],
              style: titleMedium.copyWith(
                  color: const Color(0xFF2B2B2B),
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 28,
            )
          ],
        ),
      ),
    );
  }
}
