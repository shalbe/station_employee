class ActiveClients {
  bool? status;
  String? num;
  String? msg;

  ActiveClients({this.status, this.num, this.msg});

  ActiveClients.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    num = json['Num'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Num'] = this.num;
    data['msg'] = this.msg;
    return data;
  }
}
