import 'package:google_maps_flutter/google_maps_flutter.dart';

class Market {
  String? place;
  double? latitude;
  double? longitude;
  String? kind;
  String? address;
  String? number;

  Market(
      {this.place,
      this.latitude,
      this.longitude,
      this.kind,
      this.address,
      this.number});

  Market.fromJson(Map<String, dynamic> json) {
    place = json['place'];
    latitude = json['Latitude'];
    longitude = json['Longitude'];
    kind = json['kind'];
    address = json['address'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place'] = this.place;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['kind'] = this.kind;
    data['address'] = this.address;
    data['number'] = this.number;
    return data;
  }
}
