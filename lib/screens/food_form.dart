import 'package:firebase_provider_streambuilder/model/movie_models.dart';
import 'package:flutter/material.dart';

class FoodsForm extends StatefulWidget {
  @override
  _FoodsFormState createState() => _FoodsFormState();
}

class _FoodsFormState extends State<FoodsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List _subingredients = [];
  Food _currentFood;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Form(
              autovalidate: true,
              child: Column(
                children: [
                  _showImage(),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Create Food",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ButtonTheme(
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Add Image",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    _buildNameField(),
                    _buildCategoryField(),
                    SizedBox(
                      height: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
    Widget _showImage() {
    return Text("Image here");
  }
  Widget _buildNameField(){
    return TextFormField(
      keyboardType: TextInputType.text,
      style: TextStyle(
        fontSize: 20,
      ),
      validator: (String value ){
        if (value.isEmpty) {
          return 'Name is required';
          
        }
        if (value.length<3 || value.length>20) {
          return 'Name mus be more then 3 or less then 20';
          
        }
      },
    );
  }
   Widget _buildCategoryField(){
    return TextFormField();
  }
}
