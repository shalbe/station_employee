class PendingClients {
  bool? status;
  String? num;
  String? msg;
  List<PendingClientData>? data;

  PendingClients({this.status, this.num, this.msg, this.data});

  PendingClients.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    num = json['Num'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <PendingClientData>[];
      json['data'].forEach((v) {
        data!.add(new PendingClientData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Num'] = this.num;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PendingClientData {
  int? id;
  String? number;
  String? name;
  String? email;
  String? phone;
  String? address;
  Null? location;
  int? cityId;
  String? cityName;
  String? image;
  String? qr;

  PendingClientData(
      {this.id,
      this.number,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.location,
      this.cityId,
      this.cityName,
      this.image,
      this.qr});

  PendingClientData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    location = json['location'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    image = json['image'];
    qr = json['qr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['location'] = this.location;
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['image'] = this.image;
    data['qr'] = this.qr;
    return data;
  }
}
