import 'package:flutter/material.dart';
import 'package:movie_app/presentation/resources/index.dart';
import 'package:movie_app/presentation/styles/index.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    Key? key,
    this.title,
    this.textStyle,
  }) : super(key: key);
  final TextStyle? textStyle;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title ?? AppLocalizations.shared.commonMessageNoData,
          style: textStyle ??
              titleMedium.copyWith(
                  color: AppColors.neutral2,
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
    );
  }
}
