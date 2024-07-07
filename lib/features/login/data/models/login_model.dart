class LoginModel {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  Client? client;

  LoginModel({this.accessToken, this.tokenType, this.expiresIn, this.client});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    client = json['client'] != null ? new Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    if (this.client != null) {
      data['shop'] = this.client!.toJson();
    }
    return data;
  }
}

class Client {
  int? id;
  String? qr;
  int? status;
  String? logo;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? location;
  int? totalSale;
  int? cityId;
  String? createdAt;
  String? updatedAt;

  Client(
      {this.id,
      this.qr,
      this.logo,
      this.status,
      this.name,
      this.email,
      this.password,
      this.phone,
      this.address,
      this.location,
      this.totalSale,
      this.cityId,
      this.createdAt,
      this.updatedAt});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qr = json['qr'];
    status = json['status'];
    logo = json['logo'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    location = json['location'];
    totalSale = json['total_sale'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['qr'] = this.qr;
    data['logo'] = this.logo;
    data['name'] = this.name;
    data['status'] = this.status;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['location'] = this.location;
    data['total_sale'] = this.totalSale;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
