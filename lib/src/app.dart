import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'model/Image_Model.dart';
import 'dart:convert';
import './widgets/image_list.dart';
class App extends StatefulWidget{
   @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App>{
  int counter = 0;
  List<ImageModel> list=[];
  void fetchImage() async{
    counter+=1;
    print(counter);
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel=ImageModel.fromJson(json.decode(response.body));
    setState(() {
      list.insert(0,imageModel);
    });
  }
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body:ImageList(list),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("hello World"),
        ),
      ),
    );
  }
}