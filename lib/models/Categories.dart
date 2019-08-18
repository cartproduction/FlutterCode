import 'package:flutterapp/models/ProductResponses.dart';

class Categories {
  String description;
  int id;
  String name;
  String photo;
  int position;
  List<ProductResponses> productResponses;
  String slug;

  Categories(
      {this.description,
        this.id,
        this.name,
        this.photo,
        this.position,
        this.productResponses,
        this.slug});

  Categories.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    position = json['position'];
    if (json['productResponses'] != null) {
      productResponses = new List<ProductResponses>();
      json['productResponses'].forEach((v) {
        productResponses.add(new ProductResponses.fromJson(v));
      });
    }
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['position'] = this.position;
    if (this.productResponses != null) {
      data['productResponses'] =
          this.productResponses.map((v) => v.toJson()).toList();
    }
    data['slug'] = this.slug;
    return data;
  }
}