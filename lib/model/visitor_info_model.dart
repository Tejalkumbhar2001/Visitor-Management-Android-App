class visitor_information {
  String? name;
  String? owner;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? companyName;
  String? firstName;
  int? age;
  String? village;
  String? taluka;
  String? pincode;
  String? state;
  String? country;
  String? whatsappNo;
  String? email;
  int? different;
  String? contact;
  String? company;
  String? designation;
  String? feedback;
  String? date;
  String? doctype;
  List<Product>? product;

  visitor_information(
      {this.name,
      this.owner,
      this.modifiedBy,
      this.docstatus,
      this.idx,
      this.companyName,
      this.firstName,
      this.age,
      this.village,
      this.taluka,
      this.pincode,
      this.state,
      this.country,
      this.whatsappNo,
      this.email,
      this.different,
      this.contact,
      this.company,
      this.designation,
      this.feedback,
      this.date,
      this.doctype,
      this.product});

  visitor_information.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    companyName = json['company_name'];
    firstName = json['first_name'];
    age = json['age'];
    village = json['village'];
    taluka = json['taluka'];
    pincode = json['pincode'];
    state = json['state'];
    country = json['country'];
    whatsappNo = json['whatsapp_no'];
    email = json['email'];
    different = json['different'];
    contact = json['contact'];
    company = json['company'];
    designation = json['designation'];
    feedback = json['feedback'];
    date = json['date'];
    doctype = json['doctype'];
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['modified_by'] = this.modifiedBy;
    data['docstatus'] = this.docstatus;
    data['idx'] = this.idx;
    data['company_name'] = this.companyName;
    data['first_name'] = this.firstName;
    data['age'] = this.age;
    data['village'] = this.village;
    data['taluka'] = this.taluka;
    data['pincode'] = this.pincode;
    data['state'] = this.state;
    data['country'] = this.country;
    data['whatsapp_no'] = this.whatsappNo;
    data['email'] = this.email;
    data['different'] = this.different;
    data['contact'] = this.contact;
    data['company'] = this.company;
    data['designation'] = this.designation;
    data['feedback'] = this.feedback;
    data['date'] = this.date;
    data['doctype'] = this.doctype;
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? name;
  String? owner;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? productName;
  String? product;
  String? description;
  String? companyName;
  String? parent;
  String? parentfield;
  String? parenttype;
  String? doctype;

  Product(
      {this.name,
      this.owner,
      this.modifiedBy,
      this.docstatus,
      this.idx,
      this.productName,
      this.product,
      this.description,
      this.companyName,
      this.parent,
      this.parentfield,
      this.parenttype,
      this.doctype});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    productName = json['product_name'];
    product = json['product'];
    description = json['description'];
    companyName = json['company_name'];
    parent = json['parent'];
    parentfield = json['parentfield'];
    parenttype = json['parenttype'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['modified_by'] = this.modifiedBy;
    data['docstatus'] = this.docstatus;
    data['idx'] = this.idx;
    data['product_name'] = this.productName;
    data['product'] = this.product;
    data['description'] = this.description;
    data['company_name'] = this.companyName;
    data['parent'] = this.parent;
    data['parentfield'] = this.parentfield;
    data['parenttype'] = this.parenttype;
    data['doctype'] = this.doctype;
    return data;
  }
}
