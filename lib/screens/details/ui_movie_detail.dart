import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/domain/model/index.dart';
import 'package:movie_app/presentation/utils/date_time_utility.dart';
import 'package:movie_app/presentation/widgets/image_error_view.dart';
import 'package:movie_app/screens/home/constants.dart';

class UIMovieDetail extends StatefulWidget {
  final MovieModel movie;

  const UIMovieDetail({super.key, required this.movie});

  @override
  State<UIMovieDetail> createState() => _UIMovieDetailState();
}

class _UIMovieDetailState extends State<UIMovieDetail> {
  int currentPos = 0;
  List<String> listPaths = [
    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80',
    'https://marketplace.canva.com/EAFHm4JWsu8/1/0/1600w/canva-pink-landscape-desktop-wallpaper-HGxdJA_xIx0.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3WhCJb54PbXEdCWqAaGiaUJRnIXFyJFmo4EGWqw7ilXP0-9G_4WIhzlqJwzb6ei4NUZQ&usqp=CAU',
    'https://c4.wallpaperflare.com/wallpaper/108/140/869/digital-digital-art-artwork-fantasy-art-drawing-hd-wallpaper-thumb.jpg',
    'https://c4.wallpaperflare.com/wallpaper/325/140/18/alone-stars-purple-background-hd-wallpaper-preview.jpg',
  ];

  DateTime parseDayToDateTime(String date, String time) {
    return DateTime.parse('${date} ${time}');
  }

  String textString =
      "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.  has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words";

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(children: [
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                ..._buildCarouselSlider(_size),
                const SizedBox(height: kDefaultPadding),
                _buildTitle(_size, context),
                const SizedBox(height: kDefaultPadding * 2),
                _buildSummary(context),
                _buildListTicket(context, widget.movie.watchlist ?? []),
                const SizedBox(height: kDefaultPadding * 3),
              ],
            ),
          ),
        ),
        SafeArea(child: BackButton())
      ]),
    );
  }

  Container _buildTitle(Size _size, BuildContext context) {
    return Container(
      width: _size.width * 0.9,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 50,
            color: const Color(0xFF12153D).withOpacity(0.2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          widget.movie.title ?? '',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 35),
        ),
      ),
    );
  }

  List<Widget> _buildCarouselSlider(Size size) {
    return [
      SizedBox(
        height: size.height * 0.5,
        child: CarouselSlider.builder(
          itemCount: listPaths.length,
          options: CarouselOptions(
            autoPlay: true,
            height: size.height * 0.5,
            onPageChanged: (index, reason) {
              setState(() {
                currentPos = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: listPaths[index],
                  placeholder: (context, url) => const ImageErrorView(),
                  errorWidget: (context, url, error) => const ImageErrorView(),
                ),
              ),
            );
          },
        ),
      ),
      const SizedBox(height: kDefaultPadding),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: listPaths.map((url) {
          int index = listPaths.indexOf(url);
          return Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPos == index
                  ? const Color.fromRGBO(0, 0, 0, 0.9)
                  : const Color.fromRGBO(0, 0, 0, 0.4),
            ),
          );
        }).toList(),
      ),
    ];
  }

  Widget _buildSummary(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: ExpandableText(
          textString,
          trimType: TrimType.lines,
          trim: 5,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20),
        ));
  }

  Widget _buildListTicket(BuildContext context, List<Watchlist> watchLists) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < watchLists.length; i++)
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
                      DateTimeUtility.getNameOfMonth(
                          watchLists[i].datePicker ?? ''),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      DateTimeUtility.convertTimeToFormat(
                        parseDayToDateTime(
                          watchLists[i].datePicker ?? '',
                          watchLists[i].timeShowDate ?? '',
                        ),
                      ),
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
                        child: Text(
                          'Get ticket',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
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
