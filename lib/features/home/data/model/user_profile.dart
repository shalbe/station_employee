class UserProfile {
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

  UserProfile(
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

  UserProfile.fromJson(Map<String, dynamic> json) {
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
