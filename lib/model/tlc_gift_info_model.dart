class TLCGiftAllocationModel {
  String? name;
  String? owner;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? name1;
  String? tlcMember;
  String? email;
  String? whatsappMobileNumber;
  int? giftFlag;
  String? tlcLevel;
  String? doctype;

  TLCGiftAllocationModel(
      {this.name,
        this.owner,
        this.modifiedBy,
        this.docstatus,
        this.idx,
        this.name1,
        this.tlcMember,
        this.email,
        this.whatsappMobileNumber,
        this.giftFlag,
        this.tlcLevel,
        this.doctype});

  TLCGiftAllocationModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    name1 = json['name1'];
    tlcMember = json['tlc_member'];
    email = json['email'];
    whatsappMobileNumber = json['whatsapp_mobile_number'];
    giftFlag = json['gift_flag'];
    tlcLevel = json['tlc_level'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['modified_by'] = this.modifiedBy;
    data['docstatus'] = this.docstatus;
    data['idx'] = this.idx;
    data['name1'] = this.name1;
    data['tlc_member'] = this.tlcMember;
    data['email'] = this.email;
    data['whatsapp_mobile_number'] = this.whatsappMobileNumber;
    data['gift_flag'] = this.giftFlag;
    data['tlc_level'] = this.tlcLevel;
    data['doctype'] = this.doctype;
    return data;
  }
}
