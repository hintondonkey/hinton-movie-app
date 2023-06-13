class MovieModel {
  int? id;
  List<Watchlist>? watchlist;
  String? title;
  String? description;
  String? image;
  String? showDate;
  String? timeShowDate;
  String? closeDate;
  String? timeCloseDate;
  bool? active;
  String? createDate;
  String? titleNoti;
  String? summaryNoti;

  MovieModel(
      {this.id,
        this.watchlist,
        this.title,
        this.description,
        this.image,
        this.showDate,
        this.timeShowDate,
        this.closeDate,
        this.timeCloseDate,
        this.active,
        this.createDate,
        this.titleNoti,
        this.summaryNoti});

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['watchlist'] != null) {
      watchlist = <Watchlist>[];
      json['watchlist'].forEach((v) {
        watchlist!.add(Watchlist.fromJson(v));
      });
    }
    title = json['title'];
    description = json['description'];
    image = json['image'];
    showDate = json['show_date'];
    timeShowDate = json['time_show_date'];
    closeDate = json['close_date'];
    timeCloseDate = json['time_close_date'];
    active = json['active'];
    createDate = json['create_date'];
    titleNoti = json['titleNoti'];
    summaryNoti = json['summaryNoti'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (watchlist != null) {
      data['watchlist'] = watchlist!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['show_date'] = showDate;
    data['time_show_date'] = timeShowDate;
    data['close_date'] = closeDate;
    data['time_close_date'] = timeCloseDate;
    data['active'] = active;
    data['create_date'] = createDate;
    data['titleNoti'] = titleNoti;
    data['summaryNoti'] = summaryNoti;
    return data;
  }
}

class Watchlist {
  int? id;
  String? datePicker;
  String? timeShowDate;
  int? price;
  String? website;
  bool? active;
  String? createDate;
  int? platform;

  Watchlist(
      {this.id,
        this.datePicker,
        this.timeShowDate,
        this.price,
        this.website,
        this.active,
        this.createDate,
        this.platform});

  Watchlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    datePicker = json['date_picker'];
    timeShowDate = json['time_show_date'];
    price = json['price'];
    website = json['website'];
    active = json['active'];
    createDate = json['create_date'];
    platform = json['platform'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date_picker'] = datePicker;
    data['time_show_date'] = timeShowDate;
    data['price'] = price;
    data['website'] = website;
    data['active'] = active;
    data['create_date'] = createDate;
    data['platform'] = platform;
    return data;
  }
}
