class ScanClientById {
  bool? status;
  String? num;
  String? msg;
  Data? data;

  ScanClientById({this.status, this.num, this.msg, this.data});

  ScanClientById.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    num = json['Num'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Num'] = this.num;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? location;
  int? totalSale;
  int? cityId;
  String? cityName;
  String? logo;
  String? qr;

  Data(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.location,
      this.totalSale,
      this.cityId,
      this.cityName,
      this.logo,
      this.qr});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    location = json['location'];
    totalSale = json['total_sale'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    logo = json['logo'];
    qr = json['qr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['location'] = this.location;
    data['total_sale'] = this.totalSale;
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['logo'] = this.logo;
    data['qr'] = this.qr;
    return data;
  }
}
