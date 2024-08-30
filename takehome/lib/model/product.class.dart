class Product {
  String? sId;
  String? title;
  String? imgProduct;
  int? discountPercentage;
  int? priceOriginal;
  String? description;
  int? priceDiscounted;

  Product(
      {this.sId,
      this.title,
      this.imgProduct,
      this.discountPercentage,
      this.priceOriginal,
      this.description,
      this.priceDiscounted});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    imgProduct =  json['imgProduct'];
    discountPercentage = json['discountPercentage'];
    priceOriginal = json['priceOriginal'];
    description = json['description'];
    priceDiscounted = json['priceDiscounted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['imgProduct'] = this.imgProduct;
    data['discountPercentage'] = this.discountPercentage;
    data['priceOriginal'] = this.priceOriginal;
    data['description'] = this.description;
    data['priceDiscounted'] = this.priceDiscounted;
    return data;
  }
}