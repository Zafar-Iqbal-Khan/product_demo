import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

class Products {
  Products({
    this.status,
    this.msg,
    this.noOfProducts,
    this.result,
    this.pages,
  });

  int? status;
  String? msg;
  int? noOfProducts;
  List<Result>? result;
  int? pages;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        status: json["status"],
        msg: json["msg"],
        noOfProducts: json["no_of_products"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        pages: json["pages"],
      );
}

class Result {
  Result({
    this.name,
    this.mrp,
    this.rate,
    this.gallery,
  });

  String? name;

  int? mrp;

  List<Rate>? rate;

  Gallery? gallery;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        mrp: json["mrp"],
        rate: List<Rate>.from(json["rate"].map((x) => Rate.fromJson(x))),
        gallery: Gallery.fromJson(json["gallery"]),
      );
}

class Gallery {
  Gallery({
    this.mediumThumbnailLink,
  });

  String? mediumThumbnailLink;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        mediumThumbnailLink: json["medium_thumbnail_link"],
      );
}

class Rate {
  Rate({
    this.rate,
    this.discountPercent,
  });

  int? rate;
  double? discountPercent;

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
        rate: json["rate"],
        discountPercent: json["discount_percent"].toDouble(),
      );
}
