import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  String id;
  String name;
  String imageurl;
  String category;

  List subIngredients = [];
  Timestamp createdAt;
  Timestamp updatedAt;

  Food();

  Food.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    category = data['category'];

    imageurl = data['imageurl'];
    subIngredients = data['subIngredients'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'imageurl': imageurl,
      'subIngredients': subIngredients,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}
