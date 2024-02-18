import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;

  Future _getImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Demo'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image!),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _getImage(ImageSource.gallery),
            tooltip: 'Pick Image from Gallery',
            child: Icon(Icons.photo),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () => _getImage(ImageSource.camera),
            tooltip: 'Take a Photo',
            child: Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }
}
