class GetOrderCountData {
  bool? status;
  String? nume;
  String? msg;
  dynamic data;

  GetOrderCountData({this.status, this.nume, this.msg, this.data});

  GetOrderCountData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    nume = json['Num'];
    msg = json['msg'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Num'] = this.nume;
    data['msg'] = this.msg;
    data['data'] = this.data;
    return data;
  }
}
