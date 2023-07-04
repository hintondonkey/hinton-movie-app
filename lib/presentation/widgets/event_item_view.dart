import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/index.dart';
import 'package:movie_app/data/remote/api/index.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/resources/app_localization.dart';
import 'package:movie_app/presentation/styles/index.dart';
import 'package:movie_app/presentation/widgets/index.dart';

class EventItemView extends StatelessWidget {
  const EventItemView({
    Key? key,
    required this.onTap,
    required this.streamModel,
  }) : super(key: key);
  final VoidCallback onTap;
  final StreamModel streamModel;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BuildImageWidget(
                isHorizontal: streamModel.isHorizontal ?? false,
                url: streamModel.streamPlatformImage?.first.name ?? ''),
            const SizedBox(
              height: 32,
            ),
            _BuildTitleWidget(title: streamModel.title ?? ''),
            const SizedBox(
              height: 18,
            ),
            _BuildDateTimeWidget(dateTime: DateTime.now().toIso8601String()),
            const SizedBox(
              height: 12,
            ),
            Visibility(
              visible: kBrokerId == 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _BuildTypeWidget(type: 'Type: Comedian Show'),
                  const SizedBox(
                    height: 12,
                  ),
                  const _BuildAddressWidget(
                      address: 'Unit 9, 726 Carmichael Ln, Hinton AB, Canada'),
                  const SizedBox(
                    height: 12,
                  ),
                  _BuildAuthorWidget(
                      author:
                          '${AppLocalizations.shared.txtCreatedBy}: ${streamModel.createdUser}')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _BuildImageWidget extends StatelessWidget {
  const _BuildImageWidget({
    Key? key,
    required this.url,
    required this.isHorizontal,
  }) : super(key: key);

  final String url;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: AspectRatio(
        aspectRatio: isHorizontal ? 3 / 4 : 4 / 3,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: url,
          placeholder: (context, url) => const ImageErrorView(),
          errorWidget: (context, url, error) => const ImageErrorView(),
        ),
      ),
    );
  }
}

class _BuildTitleWidget extends StatelessWidget {
  const _BuildTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: titleMedium.copyWith(
          color: AppColors.primaryTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w700),
    );
  }
}

class _BuildDateTimeWidget extends StatelessWidget {
  const _BuildDateTimeWidget({
    Key? key,
    required this.dateTime,
  }) : super(key: key);

  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Color(0xFF020125),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Text(
        dateTime.formatMovieDate(isList: false)[0],
        style: titleMedium.copyWith(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _BuildTypeWidget extends StatelessWidget {
  const _BuildTypeWidget({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return Text(
      type,
      style: titleMedium.copyWith(
          color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
    );
  }
}

class _BuildAddressWidget extends StatelessWidget {
  const _BuildAddressWidget({
    Key? key,
    required this.address,
  }) : super(key: key);

  final String address;

  @override
  Widget build(BuildContext context) {
    return Text(
      address,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: titleMedium.copyWith(
          color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
    );
  }
}

class _BuildAuthorWidget extends StatelessWidget {
  const _BuildAuthorWidget({
    Key? key,
    required this.author,
  }) : super(key: key);

  final String author;

  @override
  Widget build(BuildContext context) {
    return Text(
      author,
      style: titleMedium.copyWith(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
    );
  }
}
