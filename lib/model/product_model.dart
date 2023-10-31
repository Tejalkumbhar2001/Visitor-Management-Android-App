class Product {
  String? productName;
  String? description;
  String? productImage;
  String? name;

  Product({this.productName, this.description, this.productImage, this.name});

  Product.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    description = json['description'];
    productImage = json['product_image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['description'] = this.description;
    data['product_image'] = this.productImage;
    data['name'] = this.name;
    return data;
  }
}
