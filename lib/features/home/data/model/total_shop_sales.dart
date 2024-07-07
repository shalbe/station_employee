class GetTotalShopSales {
  bool? status;
  String? num;
  String? msg;
  dynamic data;

  GetTotalShopSales({this.status, this.num, this.msg, this.data});

  GetTotalShopSales.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    num = json['Num'];
    msg = json['msg'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Num'] = this.num;
    data['msg'] = this.msg;
    data['data'] = this.data;
    return data;
  }
}
