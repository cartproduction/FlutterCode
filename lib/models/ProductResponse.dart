import 'package:flutterapp/models/Categories.dart';

class ProductResponse {
  List<Categories> categories;
  String error;
  ProductResponse({this.categories});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }

  ProductResponse.withError(String errorValue)
      : categories = List(),
        error = errorValue;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}