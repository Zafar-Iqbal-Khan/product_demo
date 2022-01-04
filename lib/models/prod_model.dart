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
    this.gallery,
  });

  String? name;
  int? mrp;
  Gallery? gallery;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        mrp: json["mrp"],
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

  Map<String, dynamic> toJson() => {
        "medium_thumbnail_link": mediumThumbnailLink,
      };
}
