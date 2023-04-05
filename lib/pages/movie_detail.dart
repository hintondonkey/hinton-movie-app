import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF464646),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.red,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // title: const Text("Hinton Movie"),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: 86),

            SizedBox(
              child: Container(
                alignment: Alignment.center,
                // color: Colors.red,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        // color: Colors.green,
                        height: 340.74,
                        width: 230,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/movie_poster.jpg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),

                    // Container(
                    //   alignment: Alignment.center,
                    //   height: 31,
                    //   width: 219,
                    //   decoration: BoxDecoration(
                    //     border:
                    //         Border.all(color: Colors.white, width: 0.5),
                    //     color: Colors.black,
                    //     borderRadius: BorderRadius.all(
                    //       Radius.circular(20),
                    //     ),
                    //   ),
                    //   child: Text(
                    //     "Schedule",
                    //     style: TextStyle(
                    //         fontSize: 16,
                    //         fontStyle: FontStyle.normal,
                    //         fontWeight: FontWeight.w700,
                    //         color: Colors.white),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            SizedBox(height: 86.26),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  alignment: Alignment.topCenter,
                  // color: Colors.grey,
                  width: 330,
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: buildTextRM(
                        "Set around a family gathering to celebrate Easter Sunday, the comedy is based on Jo Koy’s life experiences and stand-up comedy.... Set around a family gathering to celebrate Easter Sunday, the comedy is based on Jo Koy’s life experiences and stand-up comedy. "),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            // Container(
            //   alignment: Alignment.centerLeft,
            //   child: buildButton(),
            // ),
            for (int i = 0; i < 5; i++)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Center(
                      child: Container(
                        height: 147,
                        width: 330,
                        // alignment: Alignment.center,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            // side: BorderSide(
                            //   color: Theme.of(context).colorScheme.onSurfaceVariant,
                            // ),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                          color: Color(0xFF535353),
                          // semanticContainer: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 17),
                                // color: Colors.orange,
                                child: SizedBox(
                                  // alignment: Alignment.topLeft,
                                  // color: Colors.orange,
                                  height: 48,
                                  width: 313,
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,\
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Friday, November 4, 2023",
                                        style: TextStyle(
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
                                // color: Colors.blue,
                                padding: const EdgeInsets.only(left: 17),
                                width: 221,
                                height: 34,
                                // color: Colors.orange,
                                child: SizedBox(
                                  // alignment: Alignment.topLeft,
                                  // color: Colors.orange,
                                  height: 34,
                                  width: 221,
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,\
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "7:00 PM ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          // backgroundColor: Colors.red,
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
                                  onPressed: _launchURL,
                                  style: ButtonStyle(
                                    fixedSize: MaterialStatePropertyAll<Size>(
                                        Size(270, 29)),
                                    side: MaterialStateProperty.all(BorderSide(
                                        color: Colors.black,
                                        width: 0.5,
                                        style: BorderStyle.solid)),
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Colors.black),
                                    foregroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14)),
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
                  SizedBox(height: 30),
                ],
              ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 0, right: 0),
            //   child: SizedBox(
            //     width: 263.02,
            //     height: 558,
            //     child: Container(
            //       color: Colors.blue,
            //       child: Column(
            //         children: [
            //           ClipRRect(
            //             borderRadius: BorderRadius.circular(20),
            //             child: Container(
            //               // color: Colors.green,
            //               height: 390,
            //               width: 263.02,
            //               decoration: BoxDecoration(
            //                 image: DecorationImage(
            //                     image: AssetImage("assets/movie_poster.jpg"),
            //                     fit: BoxFit.cover),
            //               ),
            //             ),
            //           ),
            //           SizedBox(height: 32),
            //           Container(
            //             height: 39,
            //             width: 253,
            //             alignment: Alignment.center,
            //             color: Colors.black,
            //             child: Text(
            //               "Aug 15, 2022",
            //               style: TextStyle(
            //                   fontSize: 22,
            //                   fontStyle: FontStyle.normal,
            //                   fontWeight: FontWeight.w700,
            //                   color: Colors.white),
            //             ),
            //           ),

            //           SizedBox(
            //             height: 20,
            //           ),
            //           // Container(
            //           //   alignment: Alignment.center,
            //           //   height: 31,
            //           //   width: 219,
            //           //   decoration: BoxDecoration(
            //           //     border:
            //           //         Border.all(color: Colors.white, width: 0.5),
            //           //     color: Colors.black,
            //           //     borderRadius: BorderRadius.all(
            //           //       Radius.circular(20),
            //           //     ),
            //           //   ),
            //           //   child: Text(
            //           //     "Schedule",
            //           //     style: TextStyle(
            //           //         fontSize: 16,
            //           //         fontStyle: FontStyle.normal,
            //           //         fontWeight: FontWeight.w700,
            //           //         color: Colors.white),
            //           //   ),
            //           // )
            //           OutlinedButton(
            //             onPressed: () {},
            //             style: ButtonStyle(
            //               fixedSize:
            //                   MaterialStatePropertyAll<Size>(Size(219, 31)),
            //               side: MaterialStateProperty.all(BorderSide(
            //                   color: Colors.white,
            //                   width: 0.5,
            //                   style: BorderStyle.solid)),
            //               backgroundColor:
            //                   MaterialStatePropertyAll<Color>(Colors.black),
            //               foregroundColor:
            //                   MaterialStatePropertyAll<Color>(Colors.white),
            //               shape: MaterialStateProperty.all(
            //                 RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(20)),
            //               ),
            //             ),
            //             child: const Text(
            //               "Schedule",
            //               style: TextStyle(
            //                   fontSize: 16,
            //                   fontStyle: FontStyle.normal,
            //                   fontWeight: FontWeight.w700,
            //                   color: Colors.white),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildButton() => ElevatedButton(
        onPressed: () => {
          setState(() {
            isReadMore = !isReadMore;
          }),
          debugPrint('Card tapped.')
        },
        child: Text(isReadMore ? "Read less" : "Read More"),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          textStyle: TextStyle(fontSize: 20),
        ),
      );
  Widget buildText(String text) {
    final maxLines = isReadMore ? null : 3;
    final overflow = isReadMore ? TextOverflow.visible : TextOverflow.ellipsis;

    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
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
      //colorClickableText: Colors.red,
      //trimLines: 5,
      trimMode: TrimMode.Length,
      trimLength: 126,
      trimCollapsedText: "Read more",
      trimExpandedText: "Read less",
      moreStyle: TextStyle(
        color: Color(0xFFC9C9C9),
        height: 1,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 22,
      ),
      lessStyle: TextStyle(
        color: Color(0xFFC9C9C9),
        height: 1,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 22,
      ),
      style: TextStyle(
        color: Color(0xFFC9C9C9),
        height: 1.25,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 22,
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://momo.vn/cinema/demon-slayer-to-the-swordsmith-village-949';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
