class VisitorAttendence {
  String? name;
  String? owner;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? userName;
  String? entryDate;
  String? entryTime;
  String? companyName;
  String? tlcMember;
  String? email;
  String? wtspNumber;
  String? doctype;

  VisitorAttendence(
      {this.name,
        this.owner,
        this.modifiedBy,
        this.docstatus,
        this.idx,
        this.userName,
        this.entryDate,
        this.entryTime,
        this.companyName,
        this.tlcMember,
        this.email,
        this.wtspNumber,
        this.doctype});

  VisitorAttendence.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    userName = json['user_name'];
    entryDate = json['entry_date'];
    entryTime = json['entry_time'];
    companyName = json['company_name'];
    tlcMember = json['tlc_member'];
    email = json['email'];
    wtspNumber = json['wtsp_number'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['modified_by'] = this.modifiedBy;
    data['docstatus'] = this.docstatus;
    data['idx'] = this.idx;
    data['user_name'] = this.userName;
    data['entry_date'] = this.entryDate;
    data['entry_time'] = this.entryTime;
    data['company_name'] = this.companyName;
    data['tlc_member'] = this.tlcMember;
    data['email'] = this.email;
    data['wtsp_number'] = this.wtspNumber;
    data['doctype'] = this.doctype;
    return data;
  }
}
