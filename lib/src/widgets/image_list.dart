import 'package:flutter/material.dart';
import '../model/Image_Model.dart';

class ImageList extends StatelessWidget{
  List<ImageModel> images;
  ImageList(this.images);
  Widget build(buildContext){
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context,int index){
          return buildChild(images[index]);
        }
    );
  }
  Widget buildChild(ImageModel image){
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      child:Column(
        children: <Widget>[
          Padding(
            child: Image.network(image.url),
            padding: EdgeInsets.only(bottom: 10.0),
          ),
          Text(image.title),
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(color:Colors.black)
      ),
    );
  }
}