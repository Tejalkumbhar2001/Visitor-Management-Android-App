class Leadmodel {
  String? leadName;
  String? name;

  Leadmodel({this.leadName, this.name});

  Leadmodel.fromJson(Map<String, dynamic> json) {
    leadName = json['lead_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lead_name'] = this.leadName;
    data['name'] = this.name;
    return data;
  }
}
