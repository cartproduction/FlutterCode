import 'package:flutterapp/models/Photos.dart';

class ProductResponses {
  String description;
  String icon;
  int id;
  String name;
  String options;
  List<Photos> photos;
  int position;
  double price;
  String slug;

  ProductResponses(
      {this.description,
        this.icon,
        this.id,
        this.name,
        this.options,
        this.photos,
        this.position,
        this.price,
        this.slug});

  ProductResponses.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    icon = json['icon'];
    id = json['id'];
    name = json['name'];
    options = json['options'];
    if (json['photos'] != null) {
      photos = new List<Photos>();
      json['photos'].forEach((v) {
        photos.add(new Photos.fromJson(v));
      });
    }
    position = json['position'];
    price = json['price'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['icon'] = this.icon;
    data['id'] = this.id;
    data['name'] = this.name;
    data['options'] = this.options;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    data['position'] = this.position;
    data['price'] = this.price;
    data['slug'] = this.slug;
    return data;
  }
}