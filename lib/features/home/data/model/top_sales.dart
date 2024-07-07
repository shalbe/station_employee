class TopSales {
  bool? status;
  String? num;
  String? msg;
  List<TopSalesData>? data;

  TopSales({this.status, this.num, this.msg, this.data});

  TopSales.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    num = json['Num'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <TopSalesData>[];
      json['data'].forEach((v) {
        data!.add(new TopSalesData.fromJson(v));
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

class TopSalesData {
  int? id;
  dynamic price;
  int? clientId;
  String? clientName;
  String? clientNumber;
  int? companyId;
  String? companyName;
  int? shopId;
  String? shopName;
  String? date;

  TopSalesData(
      {this.id,
      this.price,
      this.clientId,
      this.clientName,
      this.clientNumber,
      this.companyId,
      this.companyName,
      this.shopId,
      this.shopName,
      this.date});

  TopSalesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    clientId = json['client_id'];
    clientName = json['client_name'];
    clientNumber = json['client_number'];
    companyId = json['company_id'];
    companyName = json['company_name'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['client_id'] = this.clientId;
    data['client_name'] = this.clientName;
    data['client_number'] = this.clientNumber;
    data['company_id'] = this.companyId;
    data['company_name'] = this.companyName;
    data['shop_id'] = this.shopId;
    data['shop_name'] = this.shopName;
    data['date'] = this.date;
    return data;
  }
}
