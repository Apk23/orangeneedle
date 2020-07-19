import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orangeneedles/Components/Textstyles.dart';
import 'dart:io';

class uploadScreen extends StatefulWidget {
  static const String id = 'uploadScreen';

  @override
  _uploadScreenState createState() => _uploadScreenState();
}

class _uploadScreenState extends State<uploadScreen> {
  File imageFile;
  final picker = ImagePicker();

  _openCamera(BuildContext context) async {
    imageFile = (await picker.getImage(source: ImageSource.camera)) as File;
    setState(() {});
    Navigator.pop(context);
  }

  _openGallery(BuildContext context) async {
    imageFile = (await picker.getImage(source: ImageSource.gallery)) as File;
    setState(() {});
    Navigator.of(context).pop();
  }

  Future _optionsDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                      child: Text('Take a picture'),
                      onTap: () {
                        _openCamera(context);
                      }),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                      child: Text('Select from gallery'),
                      onTap: () {
                        _openGallery(context);
                      }),
                ],
              ),
            ),
          );
        });
  }

  Widget showdesign() {
    if (imageFile == null) {
      return Text(
        'Got your own design, share with us',
        style: h4,
      );
    } else {
      return Image.file(
        imageFile,
        height: 400,
        width: 400,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showdesign(),
              FlatButton(
                onPressed: () {
                  _optionsDialogBox(context);
                },
                child: Text('Add Media'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
