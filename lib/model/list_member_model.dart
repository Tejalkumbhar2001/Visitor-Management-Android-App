class MemberList {
  String? firstName;
  String? lastName;
  String? designation;
  String? company;
  String? name;

  MemberList(
      {this.firstName,
      this.lastName,
      this.designation,
      this.company,
      this.name});

  MemberList.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    designation = json['designation'];
    company = json['company'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['designation'] = this.designation;
    data['company'] = this.company;
    data['name'] = this.name;
    return data;
  }
}
