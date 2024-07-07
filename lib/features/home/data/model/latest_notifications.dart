
class LatestNotification {
  bool? status;
  String? num;
  String? msg;
  List<MessageData>? data;

  LatestNotification({this.status, this.num, this.msg, this.data});

  LatestNotification.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    num = json['Num'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <MessageData>[];
      json['data'].forEach((v) {
        data!.add(new MessageData.fromJson(v));
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

class MessageData {
  int? id;
  String? type;
  String? status;
  String? carNumber;
  String? message;
  Null? notes;
  String? date;
  dynamic total;
  dynamic price;
  int? quantity;
  String? brunch;
  int? materialId;
  String? materialName;
  int? employeeId;
  String? employeeName;
  int? clientId;
  String? clientName;

  MessageData(
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

  MessageData.fromJson(Map<String, dynamic> json) {
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
