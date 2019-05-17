import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/imageModel.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];


  void fetchImages() async {
    counter++;
    var url = "https://jsonplaceholder.typicode.com/photos/100";
    var response = await get(url);
    var imageModel = ImageModel.fromJSON(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: fetchImages
        ),
        appBar: AppBar(
          title: Text("Lets See Some Images"),
        ),
        body: ImageList(images),
      ),
    );
  }
}
