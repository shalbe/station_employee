class CashOrder {
  bool? status;
  String? num;
  String? msg;
  List<CashOrderData>? data;

  CashOrder({this.status, this.num, this.msg, this.data});

  CashOrder.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    num = json['Num'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <CashOrderData>[];
      json['data'].forEach((v) {
        data!.add(new CashOrderData.fromJson(v));
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

class CashOrderData {
  int? id;
  String? type;
  String? status;
  String? carNumber;
  dynamic message;
  dynamic notes;
  String? date;
  dynamic total;
  dynamic price;
  dynamic quantity;
  String? brunch;
  dynamic materialId;
  String? materialName;
  dynamic employeeId;
  String? employeeName;
  int? clientId;
  String? clientName;

  CashOrderData(
      {this.id,
      this.type,
      this.status,
      this.carNumber,
      this.message,
      this.notes,
      this.date,
      this.total,
      this.price,
      this.quantity,
      this.brunch,
      this.materialId,
      this.materialName,
      this.employeeId,
      this.employeeName,
      this.clientId,
      this.clientName});

  CashOrderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    status = json['status'];
    carNumber = json['car_number'];
    message = json['message'];
    notes = json['notes'];
    date = json['date'];
    total = json['total'];
    price = json['price'];
    quantity = json['quantity'];
    brunch = json['brunch'];
    materialId = json['material_id'];
    materialName = json['material_name'];
    employeeId = json['employee_id'];
    employeeName = json['employee_name'];
    clientId = json['client_id'];
    clientName = json['client_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['status'] = this.status;
    data['car_number'] = this.carNumber;
    data['message'] = this.message;
    data['notes'] = this.notes;
    data['date'] = this.date;
    data['total'] = this.total;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['brunch'] = this.brunch;
    data['material_id'] = this.materialId;
    data['material_name'] = this.materialName;
    data['employee_id'] = this.employeeId;
    data['employee_name'] = this.employeeName;
    data['client_id'] = this.clientId;
    data['client_name'] = this.clientName;
    return data;
  }
}
