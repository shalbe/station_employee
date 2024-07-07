class AppSettings {
  bool? status;
  String? num;
  String? msg;
  Data? data;

  AppSettings({this.status, this.num, this.msg, this.data});

  AppSettings.fromJson(Map<String, dynamic> json) {
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
  String? logo;
  String? fave;
  String? name;

  Data({this.logo, this.fave, this.name});

  Data.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
    fave = json['fave'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logo'] = this.logo;
    data['fave'] = this.fave;
    data['name'] = this.name;
    return data;
  }
}
