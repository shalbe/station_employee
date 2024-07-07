class GetMaterials {
  bool? status;
  String? num;
  String? msg;
  List<MaterialData>? data;

  GetMaterials({this.status, this.num, this.msg, this.data});

  GetMaterials.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    num = json['Num'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <MaterialData>[];
      json['data'].forEach((v) {
        data!.add(new MaterialData.fromJson(v));
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

class MaterialData {
  int? id;
  String? name;

  MaterialData({this.id, this.name});

  MaterialData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
