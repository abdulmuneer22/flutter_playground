import 'package:flutter/material.dart';

import '../models/imageModel.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey, width: 2.0, style: BorderStyle.solid)),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(20.0),
//      child: Image.network(image.url) <= for single image
      child: Column(
        children: <Widget>[
          Padding(
            child: Image.network(image.url),
            padding: EdgeInsets.only(bottom: 10.0),
          ),
          Text(image.title)
        ],
      ),
    );
  }
}
