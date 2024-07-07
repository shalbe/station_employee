class RegisterModel {
  String? message;
  Client? client;

  RegisterModel({this.message, this.client});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    return data;
  }
}

class Client {
  int? id;
  Null? image;
  String? qr;
  String? name;
  String? number;
  String? phone;
  String? address;
  String? email;
  String? password;
  int? totalBuy;
  int? totalDue;
  int? status;
  int? cityId;
  int? shopId;
  String? createdAt;
  String? updatedAt;

  Client(
      {this.id,
      this.image,
      this.qr,
      this.name,
      this.number,
      this.phone,
      this.address,
      this.email,
      this.password,
      this.totalBuy,
      this.totalDue,
      this.status,
      this.cityId,
      this.shopId,
      this.createdAt,
      this.updatedAt});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    qr = json['qr'];
    name = json['name'];
    number = json['number'];
    phone = json['phone'];
    address = json['address'];
    email = json['email'];
    password = json['password'];
    totalBuy = json['total_buy'];
    totalDue = json['total_due'];
    status = json['status'];
    cityId = json['city_id'];
    shopId = json['shop_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['qr'] = this.qr;
    data['name'] = this.name;
    data['number'] = this.number;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['email'] = this.email;
    data['password'] = this.password;
    data['total_buy'] = this.totalBuy;
    data['total_due'] = this.totalDue;
    data['status'] = this.status;
    data['city_id'] = this.cityId;
    data['shop_id'] = this.shopId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
