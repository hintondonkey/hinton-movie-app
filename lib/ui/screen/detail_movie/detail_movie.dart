import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/domain/model/movies_response.dart';
import 'package:movie_app/ui/screen/detail_movie/detail_movie_state.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

import 'detail_movie_bloc.dart';
import 'detail_movie_event.dart';

class DetailScreenArguments {
  const DetailScreenArguments({
    required this.id,
  });
  final int id;
}

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailMovieBloc(),
      child: MovieDetail(idMovie: id),
    );
  }
}

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key, required this.idMovie});
  final int idMovie;
  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  bool isReadMore = false;
  @override
  void initState() {
    BlocProvider.of<DetailMovieBloc>(context)
        .add(GetMovieEvent(widget.idMovie));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMovieBloc, DetailMovieState>(
        builder: (context, state) => state.mvList != null
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color(0xFF464646),
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.red,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                body: Container(
                  alignment: Alignment.center,
                  color: Colors.black,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(height: 86),
                      SizedBox(
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  height: 340.74,
                                  width: 230,
                                  child: Image.network(state.mvList!.image),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 86.26),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Container(
                            alignment: Alignment.topCenter,
                            // color: Colors.grey,
                            width: 330,
                            child: Padding(
                              padding: const EdgeInsets.only(),
                              child: buildTextRM(state.mvList!.description),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      for (int i = 0; i < state.mvList!.watchlist.length; i++)
                        ItemTicket(ticket: state.mvList!.watchlist[i]),
                    ],
                  ),
                ),
              )
            : const SizedBox());
  }

  Widget buildButton() => ElevatedButton(
        onPressed: () => {
          setState(() {
            isReadMore = !isReadMore;
          }),
          debugPrint('Card tapped.')
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          textStyle: const TextStyle(fontSize: 20),
        ),
        child: Text(isReadMore ? "Read less" : "Read More"),
      );
  Widget buildText(String text) {
    final maxLines = isReadMore ? null : 3;
    final overflow = isReadMore ? TextOverflow.visible : TextOverflow.ellipsis;

    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: const TextStyle(
        height: 1,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 20,
      ),
    );
  }

  Widget buildTextRM(String text) {
    return ReadMoreText(
      text,
      trimMode: TrimMode.Length,
      trimLength: 126,
      trimCollapsedText: "Read more",
      trimExpandedText: "Read less",
      moreStyle: const TextStyle(
        color: Color(0xFFC9C9C9),
        height: 1,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 22,
      ),
      lessStyle: const TextStyle(
        color: Color(0xFFC9C9C9),
        height: 1,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 22,
      ),
      style: const TextStyle(
        color: Color(0xFFC9C9C9),
        height: 1.25,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 22,
      ),
    );
  }
}

class ItemTicket extends StatelessWidget {
  const ItemTicket({super.key, this.ticket});
  final Watchlist? ticket;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Center(
            child: SizedBox(
              height: 147,
              width: 330,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 0,
                color: const Color(0xFF535353),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 17),
                      child: SizedBox(
                        height: 48,
                        width: 313,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              convertDate(ticket!.datePicker),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                // backgroundColor: Colors.red,
                                fontWeight: FontWeight.w700,
                                height: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 17),
                      width: 221,
                      height: 34,
                      child: SizedBox(
                        height: 34,
                        width: 221,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              convertTime(ticket!.timeShowDate),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: OutlinedButton(
                        onPressed: () async {
                          _launchURL(ticket!.website);
                        },
                        style: ButtonStyle(
                          fixedSize: const MaterialStatePropertyAll<Size>(
                              Size(270, 29)),
                          side: MaterialStateProperty.all(const BorderSide(
                              color: Colors.black,
                              width: 0.5,
                              style: BorderStyle.solid)),
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Colors.black),
                          foregroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Colors.white),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                          ),
                        ),
                        child: const Text(
                          "Get ticket from our website",
                          style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  String convertDate(String date) {
    return DateFormat('EEEE, MMMM d, y').format(DateTime.parse(date));
  }

  String convertTime(String time) {
    final timeString = DateFormat('HH:mm:ss').parse(time);
    return DateFormat('h:mm a').format(timeString);
  }
}

_launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
