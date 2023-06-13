import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageErrorView extends StatelessWidget {
  const ImageErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: Container(
        height: 250,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
      ),
    );
  }
}
