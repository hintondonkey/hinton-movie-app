class Movie {
  final int id;
  final int year;
  final int numOfRatings;
  final int criticsReview;
  final int metascoreRating;
  final double rating;
  final List<String> genra;
  final String plot;
  final String title;
  final String poster;
  final String backdrop;
  final List<Map> cast;

  Movie({
    required this.id,
    required this.year,
    required this.numOfRatings,
    required this.criticsReview,
    required this.metascoreRating,
    required this.rating,
    required this.genra,
    required this.plot,
    required this.title,
    required this.poster,
    required this.backdrop,
    required this.cast,
  });
}

List<Movie> movies = [
  Movie(
    id: 1,
    year: 2020,
    numOfRatings: 150212,
    criticsReview: 50,
    metascoreRating: 76,
    rating: 7.3,
    genra: ['Action', 'Drama'],
    plot: plotText,
    title: 'Ngày Em Đẹp Nhất',
    poster: 'assets/images/poster_1.jpg',
    backdrop: 'assets/images/backdrop_1.jpg',
    cast: [
      {
        "orginalName": "Sơn Tùng MTP",
        "movieName": "Director",
        "image": "assets/images/actor_1.jpg",
      },
      {
        "orginalName": "Suni Hạ Linh",
        "movieName": "Director",
        "image": "assets/images/actor_2.jpg",
      },
      {
        "orginalName": "Jun Vũ",
        "movieName": "Director",
        "image": "assets/images/actor_3.jpg",
      },
      {
        "orginalName": "Đại Thánh",
        "movieName": "Director",
        "image": "assets/images/actor_4.jpg",
      },
      {
        "orginalName": "IU",
        "movieName": "Director",
        "image": "assets/images/actor_5.jpg",
      }
    ],
  ),
  Movie(
    id: 1,
    year: 2020,
    numOfRatings: 150212,
    criticsReview: 50,
    metascoreRating: 76,
    rating: 7.3,
    genra: ['Action', 'Drama'],
    plot: plotText,
    title: 'Making My Way',
    poster: 'assets/images/poster_2.jpg',
    backdrop: 'assets/images/backdrop_2.jpg',
    cast: [
      {
        "orginalName": "Sơn Tùng MTP",
        "movieName": "Director",
        "image": "assets/images/actor_1.jpg",
      },
      {
        "orginalName": "Suni Hạ Linh",
        "movieName": "Director",
        "image": "assets/images/actor_2.jpg",
      },
      {
        "orginalName": "Jun Vũ",
        "movieName": "Director",
        "image": "assets/images/actor_3.jpg",
      },
      {
        "orginalName": "Đại Thánh",
        "movieName": "Director",
        "image": "assets/images/actor_4.jpg",
      },
      {
        "orginalName": "IU",
        "movieName": "Director",
        "image": "assets/images/actor_5.jpg",
      }
    ],
  ),
  Movie(
    id: 1,
    year: 2020,
    numOfRatings: 150212,
    criticsReview: 50,
    metascoreRating: 76,
    rating: 7.3,
    genra: ['Action', 'Drama'],
    plot: plotText,
    title: 'Ngỏ Lời',
    poster: 'assets/images/poster_3.jpg',
    backdrop: 'assets/images/backdrop_3.jpg',
    cast: [
      {
        "orginalName": "Sơn Tùng MTP",
        "movieName": "Director",
        "image": "assets/images/actor_1.jpg",
      },
      {
        "orginalName": "Suni Hạ Linh",
        "movieName": "Director",
        "image": "assets/images/actor_2.jpg",
      },
      {
        "orginalName": "Jun Vũ",
        "movieName": "Director",
        "image": "assets/images/actor_3.jpg",
      },
      {
        "orginalName": "Đại Thánh",
        "movieName": "Director",
        "image": "assets/images/actor_4.jpg",
      },
      {
        "orginalName": "IU",
        "movieName": "Director",
        "image": "assets/images/actor_5.jpg",
      }
    ],
  ),
  Movie(
    id: 1,
    year: 2020,
    numOfRatings: 150212,
    criticsReview: 50,
    metascoreRating: 76,
    rating: 7.3,
    genra: ['Action', 'Drama'],
    plot: plotText,
    title: 'End Game',
    poster: 'assets/images/poster_4.jpg',
    backdrop: 'assets/images/backdrop_4.jpg',
    cast: [
      {
        "orginalName": "Sơn Tùng MTP",
        "movieName": "Director",
        "image": "assets/images/actor_1.jpg",
      },
      {
        "orginalName": "Suni Hạ Linh",
        "movieName": "Director",
        "image": "assets/images/actor_2.jpg",
      },
      {
        "orginalName": "Jun Vũ",
        "movieName": "Director",
        "image": "assets/images/actor_3.jpg",
      },
      {
        "orginalName": "Đại Thánh",
        "movieName": "Director",
        "image": "assets/images/actor_4.jpg",
      },
      {
        "orginalName": "IU",
        "movieName": "Director",
        "image": "assets/images/actor_5.jpg",
      }
    ],
  ),
  Movie(
    id: 1,
    year: 2020,
    numOfRatings: 150212,
    criticsReview: 50,
    metascoreRating: 76,
    rating: 7.3,
    genra: ['Action', 'Drama'],
    plot: plotText,
    title: 'Để Mị Nói Cho Mà Nghe',
    poster: 'assets/images/poster_5.jpg',
    backdrop: 'assets/images/backdrop_5.jpg',
    cast: [
      {
        "orginalName": "Sơn Tùng MTP",
        "movieName": "Director",
        "image": "assets/images/actor_1.jpg",
      },
      {
        "orginalName": "Suni Hạ Linh",
        "movieName": "Director",
        "image": "assets/images/actor_2.jpg",
      },
      {
        "orginalName": "Jun Vũ",
        "movieName": "Director",
        "image": "assets/images/actor_3.jpg",
      },
      {
        "orginalName": "Đại Thánh",
        "movieName": "Director",
        "image": "assets/images/actor_4.jpg",
      },
      {
        "orginalName": "IU",
        "movieName": "Director",
        "image": "assets/images/actor_5.jpg",
      }
    ],
  )
];

const String plotText =
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' ";
