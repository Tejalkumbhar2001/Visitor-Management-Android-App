class EventList {
  String? eventName;
  String? startsOn;
  String? endsOn;
  String? status;
  String? location;
  String? name;

  EventList(
      {this.eventName,
        this.startsOn,
        this.endsOn,
        this.status,
        this.location,
        this.name});

  EventList.fromJson(Map<String, dynamic> json) {
    eventName = json['event_name'];
    startsOn = json['starts_on'];
    endsOn = json['ends_on'];
    status = json['status'];
    location = json['location'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_name'] = this.eventName;
    data['starts_on'] = this.startsOn;
    data['ends_on'] = this.endsOn;
    data['status'] = this.status;
    data['location'] = this.location;
    data['name'] = this.name;
    return data;
  }
}
