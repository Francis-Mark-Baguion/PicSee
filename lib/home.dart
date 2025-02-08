import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/camera.png',
          fit: BoxFit.contain,
        ),
        title: Text(
          "PicSee",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            letterSpacing: 2.0,
            wordSpacing: 5.0,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 3.0,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            height: 400,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            child: Center(
              child: _selectedImage != null
                  ? Image.file(
                      _selectedImage!,
                      fit: BoxFit.contain,
                    )
                  : Text("No Image"),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                _pickImageFromGallery();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 4.0,
                backgroundColor: Colors.white,
              ),
              child: Text(
                "Import Image",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                _pickImageFromCamera();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 4.0,
                backgroundColor: Colors.white,
              ),
              child: Text(
                "Capture Image",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text("© 2024 FMB. All rights reserved."),
        ],
      )),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      {
        _selectedImage = File(returnedImage.path);
      }
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    setState(() {
      {
        _selectedImage = File(returnedImage.path);
      }
    });
  }
}
