class Team_member {
  String? name;
  String? owner;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? role;
  String? designation;
  String? company;
  String? password;
  String? confirmPassword;
  String? doctype;

  Team_member(
      {this.name,
      this.owner,
      this.modifiedBy,
      this.docstatus,
      this.idx,
      this.firstName,
      this.lastName,
      this.email,
      this.mobile,
      this.role,
      this.designation,
      this.company,
      this.password,
      this.confirmPassword,
      this.doctype});

  Team_member.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile = json['mobile'];
    role = json['role'];
    designation = json['designation'];
    company = json['company'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['modified_by'] = this.modifiedBy;
    data['docstatus'] = this.docstatus;
    data['idx'] = this.idx;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['role'] = this.role;
    data['designation'] = this.designation;
    data['company'] = this.company;
    data['password'] = this.password;
    data['confirm_password'] = this.confirmPassword;
    data['doctype'] = this.doctype;
    return data;
  }
}
