import 'dart:ffi';

class UserProfile {
  int? id;
  String? number;
  String? name;
  String? email;
  dynamic totalBuy;
  dynamic totalDue;
  String? phone;
  String? address;
  Null? location;
  int? cityId;
  String? cityName;
  int? shopId;
  String? shopName;
  String? image;
  String? qr;

  UserProfile(
      {this.id,
      this.number,
      this.totalBuy,
      this.totalDue,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.location,
      this.cityId,
      this.cityName,
      this.shopId,
      this.shopName,
      this.image,
      this.qr});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalBuy = json['total_buy'];
    number = json['number'];
    totalDue = json['total_due'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    location = json['location'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    image = json['image'];
    qr = json['qr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['total_due'] = this.totalDue;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['location'] = this.location;
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['image'] = this.image;
    data['qr'] = this.qr;
    return data;
  }
}
