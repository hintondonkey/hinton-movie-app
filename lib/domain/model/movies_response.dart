import 'dart:convert';

List<MoviesResponse> moviesResponseFromJson(String str) =>
    List<MoviesResponse>.from(
        json.decode(str).map((x) => MoviesResponse.fromJson(x)));

String moviesResponseToJson(List<MoviesResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ListMoviesResponse {
//   List<MoviesResponse> list;
//   ListMoviesResponse(this.list);
// }

class MoviesResponse {
  MoviesResponse({
    required this.id,
    required this.watchlist,
    required this.title,
    required this.description,
    required this.image,
    required this.showDate,
    required this.timeShowDate,
    required this.closeDate,
    required this.timeCloseDate,
    required this.active,
    required this.createDate,
  });

  int id;
  List<Watchlist> watchlist;
  String title;
  String description;
  String image;
  String showDate;
  String timeShowDate;
  String closeDate;
  String timeCloseDate;
  bool active;
  String createDate;

  factory MoviesResponse.fromJson(Map<String, dynamic> json) => MoviesResponse(
        id: json["id"],
        watchlist: List<Watchlist>.from(
            json["watchlist"].map((x) => Watchlist.fromJson(x))),
        title: json["title"],
        description: json["description"],
        image: json["image"],
        showDate: json["show_date"],
        timeShowDate: json["time_show_date"],
        closeDate: json["close_date"],
        timeCloseDate: json["time_close_date"],
        active: json["active"],
        createDate: json["create_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "watchlist": List<dynamic>.from(watchlist.map((x) => x.toJson())),
        "title": title,
        "description": description,
        "image": image,
        "show_date": showDate,
        "time_show_date": timeShowDate,
        "close_date": closeDate,
        "time_close_date": timeCloseDate,
        "active": active,
        "create_date": createDate,
      };
}

class Watchlist {
  Watchlist({
    required this.id,
    required this.datePicker,
    required this.timeShowDate,
    required this.price,
    required this.website,
    required this.active,
    required this.createDate,
    required this.platform,
  });

  int id;
  String datePicker;
  String timeShowDate;
  int price;
  String website;
  bool active;
  String createDate;
  int platform;

  factory Watchlist.fromJson(Map<String, dynamic> json) => Watchlist(
        id: json["id"],
        datePicker: json["date_picker"],
        timeShowDate: json["time_show_date"],
        price: json["price"],
        website: json["website"],
        active: json["active"],
        createDate: json["create_date"],
        platform: json["platform"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_picker": datePicker,
        "time_show_date": timeShowDate,
        "price": price,
        "website": website,
        "active": active,
        "create_date": createDate,
        "platform": platform,
      };
}
