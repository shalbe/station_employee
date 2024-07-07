class GetClientCar {
  bool? status;
  String? num;
  String? msg;
  List<ClientCarData>? data;

  GetClientCar({this.status, this.num, this.msg, this.data});

  GetClientCar.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    num = json['Num'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ClientCarData>[];
      json['data'].forEach((v) {
        data!.add(new ClientCarData.fromJson(v));
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

class ClientCarData {
  dynamic number;
  dynamic maxDebit;
  dynamic defaultMaxDebit;
  dynamic materialId;
  dynamic materialName;
  dynamic qr;

  ClientCarData(
      {this.number,
      this.maxDebit,
      this.defaultMaxDebit,
      this.materialId,
      this.materialName,
      this.qr});

  ClientCarData.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    maxDebit = json['max_debit'];
    defaultMaxDebit = json['default_max_debit'];
    materialId = json['material_id'];
    materialName = json['material_name'];
    qr = json['qr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['max_debit'] = this.maxDebit;
    data['default_max_debit'] = this.defaultMaxDebit;
    data['material_id'] = this.materialId;
    data['material_name'] = this.materialName;
    data['qr'] = this.qr;
    return data;
  }
}
