class CarDetails {
  bool? status;
  String? num;
  String? msg;
  CarsData? data;

  CarDetails({this.status, this.num, this.msg, this.data});

  CarDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    num = json['Num'];
    msg = json['msg'];
    data = json['data'] != null ? new CarsData.fromJson(json['data']) : null;
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

class CarsData {
  String? number;
  int? id;
  dynamic maxDebit;
  dynamic price;
  dynamic defaultMaxDebit;
  dynamic materialId;
  String? materialName;
  String? clientName;
  String? qr;

  CarsData(
      {this.number,
      this.maxDebit,
      this.id,
      this.price,
      this.defaultMaxDebit,
      this.materialId,
      this.materialName,
      this.clientName,
      this.qr});

  CarsData.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    maxDebit = json['max_debit'];
    id = json['id'];
    price = json['price'];
    defaultMaxDebit = json['default_max_debit'];
    materialId = json['material_id'];
    materialName = json['material_name'];
    clientName = json['client_name'];
    qr = json['qr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['max_debit'] = this.maxDebit;
    data['id'] = this.id;
    data['price'] = this.price;
    data['default_max_debit'] = this.defaultMaxDebit;
    data['material_id'] = this.materialId;
    data['material_name'] = this.materialName;
    data['client_name'] = this.clientName;
    data['qr'] = this.qr;
    return data;
  }
}
