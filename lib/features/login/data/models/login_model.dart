class LoginModel {
  String? accessToken;
  String? tokenType;
  dynamic expiresIn;
  Employee? employee;

  LoginModel({this.accessToken, this.tokenType, this.expiresIn, this.employee});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    employee = json['employee'] != null
        ? new Employee.fromJson(json['employee'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    return data;
  }
}

class Employee {
  dynamic id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? password;
  dynamic storage;
  dynamic makeDebit;
  dynamic getDebit;
  String? createdAt;
  String? updatedAt;

  Employee(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.password,
      this.storage,
      this.makeDebit,
      this.getDebit,
      this.createdAt,
      this.updatedAt});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    storage = json['storage'];
    makeDebit = json['make_debit'];
    getDebit = json['get_debit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['password'] = this.password;
    data['storage'] = this.storage;
    data['make_debit'] = this.makeDebit;
    data['get_debit'] = this.getDebit;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
