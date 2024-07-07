class pendingWithdraws {
  bool? status;
  String? num;
  String? msg;
  List<pendingData>? data;

  pendingWithdraws({this.status, this.num, this.msg, this.data});

  pendingWithdraws.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    num = json['Num'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <pendingData>[];
      json['data'].forEach((v) {
        data!.add(new pendingData.fromJson(v));
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

class pendingData {
  int? id;
  int? credit;
  int? employeeId;
  String? employeeName;
  String? date;
  String? status;

  pendingData(
      {this.id,
      this.credit,
      this.employeeId,
      this.employeeName,
      this.date,
      this.status});

  pendingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    credit = json['credit'];
    employeeId = json['employee_id'];
    employeeName = json['employee_name'];
    date = json['date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['credit'] = this.credit;
    data['employee_id'] = this.employeeId;
    data['employee_name'] = this.employeeName;
    data['date'] = this.date;
    data['status'] = this.status;
    return data;
  }
}
