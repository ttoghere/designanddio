// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Category {
  final int categoryId;
  final String categoryName;
  final String categoryDesc;
  final int parent;
  final ProductImage image;
  Category({
    required this.categoryId,
    required this.categoryName,
    required this.categoryDesc,
    required this.parent,
    required this.image,
  });
 

  Category.fromJson(Map<String, dynamic> json) :
    categoryId = json["id"],
    categoryName = json["name"],
    categoryDesc = json["description"],
    parent = json["parent"],
    image = json["image"] != null ? ProductImage.fromJson(json["image"]) : null;
  
}

class ProductImage {
  String url;
  ProductImage({required this.url});
  ProductImage.fromJson(Map<String, dynamic> json) :
    url = json["url"];
  
}
