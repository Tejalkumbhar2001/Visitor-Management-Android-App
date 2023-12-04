class Event {
  String? name;
  String? owner;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? eventName;
  String? startsOn;
  String? endsOn;
  String? status;
  String? location;
  String? doctype;

  Event(
      {this.name,
        this.owner,
        this.modifiedBy,
        this.docstatus,
        this.idx,
        this.eventName,
        this.startsOn,
        this.endsOn,
        this.status,
        this.location,
        this.doctype});

  Event.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    eventName = json['event_name'];
    startsOn = json['starts_on'];
    endsOn = json['ends_on'];
    status = json['status'];
    location = json['location'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['modified_by'] = this.modifiedBy;
    data['docstatus'] = this.docstatus;
    data['idx'] = this.idx;
    data['event_name'] = this.eventName;
    data['starts_on'] = this.startsOn;
    data['ends_on'] = this.endsOn;
    data['status'] = this.status;
    data['location'] = this.location;
    data['doctype'] = this.doctype;
    return data;
  }
}
