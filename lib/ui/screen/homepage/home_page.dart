import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/pages/movie_detail.dart';
import 'package:movie_app/ui/screen/homepage/home_page_bloc.dart';
import 'package:movie_app/ui/screen/homepage/home_page_state.dart';

import '../../../domain/model/movies_response.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(),
      child: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePagesState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF464646),
          title: const Text("Hinton Movie"),
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.black,
          child: ListView.builder(
            itemCount: state.mvList.length,
            itemBuilder: (BuildContext context, int index) {
              return itemMovie(context, state.mvList[index]);
            },
          ),
        ),
      ),
    );
  }

//const SizedBox(height: 73),
  Widget itemMovie(BuildContext context, MoviesResponse movie) {
    return Padding(
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
                        image: AssetImage(movie.image),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Container(
                height: 39,
                width: 253,
                alignment: Alignment.center,
                color: Colors.black,
                child: Text(
                  movie.showDate,
                  style: const TextStyle(
                      fontSize: 22,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
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
                      const MaterialStatePropertyAll<Size>(Size(219, 31)),
                  side: MaterialStateProperty.all(const BorderSide(
                      color: Colors.white,
                      width: 0.5,
                      style: BorderStyle.solid)),
                  backgroundColor:
                      const MaterialStatePropertyAll<Color>(Colors.black),
                  foregroundColor:
                      const MaterialStatePropertyAll<Color>(Colors.white),
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
    );
  }
}
