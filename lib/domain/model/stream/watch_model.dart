class WatchModel {
  int? id;
  String? datePicker;
  String? timeShowDate;
  int? price;
  String? website;
  bool? active;
  String? createDate;
  int? platform;

  WatchModel(
      {this.id,
        this.datePicker,
        this.timeShowDate,
        this.price,
        this.website,
        this.active,
        this.createDate,
        this.platform});

  WatchModel.fromJson(Map<String, dynamic> json) {
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
