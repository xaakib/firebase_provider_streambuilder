import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TexEditField extends StatefulWidget {
  @override
  _TexEditFieldState createState() => _TexEditFieldState();
}

class _TexEditFieldState extends State<TexEditField> {
  TextEditingController nameController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  Map<String, dynamic> productToAdd;
  CollectionReference collectionReference =
      Firestore.instance.collection("secoundImage");

  addProduct() {
    productToAdd = {
      // "name": nameController.text,
      // "brand": brandController.text,
      // "price": priceController.text,
      "image": imageUrlController.text,
    };
    collectionReference
        .add(productToAdd)
        .whenComplete(() => print("Added to the Batabase"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Crud"),
      ),
      body: Column(
        children: [
          // SizedBox(
          //   height: 5,
          // ),
          // _buildTextField(nameController, "name"),
          // SizedBox(
          //   height: 5,
          // ),
          // _buildTextField(brandController, "Brand"),
          // SizedBox(
          //   height: 5,
          // ),
          // _buildTextField(priceController, "Price"),
          // SizedBox(
          //   height: 5,
          // ),
          _buildTextField(imageUrlController, "Image Url"),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 5,
          ),
          FlatButton(
              onPressed: () {
                addProduct();
              },
              child: Text(
                "Add Product to Database",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              color: Colors.black),
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              color: Colors.black),
        ],
      ),
    );
  }

  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(
          color: Colors.red,
        ),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}