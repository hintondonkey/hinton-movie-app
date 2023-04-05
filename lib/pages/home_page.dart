import 'package:flutter/material.dart';
import 'package:movie_app/pages/movie_detail.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF464646),
        title: const Text("Hinton Movie"),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: 73),
            for (int i = 0; i < 5; i++)
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: SizedBox(
                  width: 263.02,
                  height: 558,
                  child: Container(
                    color: Colors.black,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            // color: Colors.green,
                            height: 390,
                            width: 263.02,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/movie_poster.jpg"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        SizedBox(height: 32),
                        Container(
                          height: 39,
                          width: 253,
                          alignment: Alignment.center,
                          color: Colors.black,
                          child: Text(
                            "Aug 15, 2022",
                            style: TextStyle(
                                fontSize: 22,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MovieDetail()),
                            );
                          },
                          style: ButtonStyle(
                            fixedSize:
                                MaterialStatePropertyAll<Size>(Size(219, 31)),
                            side: MaterialStateProperty.all(BorderSide(
                                color: Colors.white,
                                width: 0.5,
                                style: BorderStyle.solid)),
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.black),
                            foregroundColor:
                                MaterialStatePropertyAll<Color>(Colors.white),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          child: const Text(
                            "Schedule",
                            style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
