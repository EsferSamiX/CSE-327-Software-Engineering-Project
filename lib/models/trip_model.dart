class TripModel {
  TripModel({
    required this.data,
    required this.msg,
  });
  late final List<Data> data;
  late final String msg;

  TripModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['msg'] = msg;
    return _data;
  }
}

class Data {
  Data({
    required this.date,
    this.departTime,
    required this.fromLocation,
    required this.id,
    required this.price,
    this.seatTaken,
    required this.seats,
    required this.seatsAvailable,
    required this.title,
    required this.toLocation,
  });
  late final String date;
  late final String? departTime;
  late final String fromLocation;
  late final int id;
  late final double price;
  late final String? seatTaken;
  late final int? seatsAvailable;
  late final int seats;
  late final String title;
  late final String toLocation;

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    departTime = json['departTime'];
    fromLocation = json['fromLocation'];
    id = json['id'];
    price = json['price'];
    seatTaken = json['seatTaken'];
    seatsAvailable = json['seatsAvailable'];
    seats = json['seats'];
    title = json['title'];
    toLocation = json['toLocation'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['departTime'] = departTime;
    _data['fromLocation'] = fromLocation;
    _data['id'] = id;
    _data['price'] = price;
    _data['seatTaken'] = seatTaken;
    _data['seats'] = seats;
    _data['title'] = title;
    _data['toLocation'] = toLocation;
    return _data;
  }
}
