import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/presentation/navigator/page_navigator.dart';
import 'package:movie_app/presentation/resources/index.dart';
import 'package:movie_app/presentation/styles/index.dart';

class HintonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final String? title;
  final Widget? iconRight;
  final Widget? iconLeft;
  final VoidCallback? onTapSearch;
  final Color? bgrColor;
  final Color? iconColor;
  final Color? textColor;

  const HintonAppBar({
    Key? key,
    this.onBack,
    this.title,
    this.iconRight,
    this.onTapSearch,
    this.bgrColor,
    this.iconLeft,
    this.iconColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        height: kToolbarHeight,
        padding: const EdgeInsets.symmetric(horizontal: 17),
        color: bgrColor ?? Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconLeft ??
                SizedBox(
                  width: 24,
                  height: 24,
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        onBack != null
                            ? onBack!()
                            : navigator.popBack(context: context);
                      },
                      icon: SvgPicture.asset(AppImages.icBack,
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                              iconColor ?? Colors.black,
                              BlendMode.srcIn))),
                ),
            const SizedBox(
              width: 11,
            ),
            Expanded(
              child: Text(
                title ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: titleMedium.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: textColor ?? AppColors.textColorMain),
              ),
            ),
            // const Spacer(),
            iconRight ?? const SizedBox()
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
