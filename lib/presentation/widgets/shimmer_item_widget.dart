import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItemWidget extends StatelessWidget {
  const ShimmerItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var enabled = true;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        enabled: enabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 32),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            Container(
              width: 100,
              height: 20,
              margin:
                  const EdgeInsets.only(top: 8, left: 32),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            Container(
              width: 150,
              height: 20,
              margin:
                  const EdgeInsets.only(top: 8, left: 32),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            Container(
              width: 200,
              height: 20,
              margin:
                  const EdgeInsets.only(top: 8, left: 32),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ],
        ),
      ),
    );
  }
}
