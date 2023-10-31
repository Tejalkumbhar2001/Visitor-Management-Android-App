class visitor_list {
  String? company;
  String? whatsappNo;
  String? firstName;
  String? name;

  visitor_list({this.company, this.whatsappNo, this.firstName, this.name});

  visitor_list.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    whatsappNo = json['whatsapp_no'];
    firstName = json['first_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.company;
    data['whatsapp_no'] = this.whatsappNo;
    data['first_name'] = this.firstName;
    data['name'] = this.name;
    return data;
  }
}
