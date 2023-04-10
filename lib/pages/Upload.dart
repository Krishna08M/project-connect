import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media/widgets/header.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _image;
  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, strTitle: 'New Post'),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black, Colors.blueAccent])),
        padding: EdgeInsets.only(top: 30),
        child: Center(
          child: Column(
            children: <Widget>[
              _image != null
                  ? Image.file(_image!,
                      width: 250, height: 250, fit: BoxFit.cover)
                  : Image(
                      image: AssetImage('lib/images/upload.png'),
                    ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                title: 'Gallary',
                icon: Icons.image_outlined,
                onClick: () => getImage(ImageSource.gallery),
              ),
              //Text('Button'),
              CustomButton(
                  title: 'camera',
                  icon: Icons.camera_alt_outlined,
                  onClick: () => getImage(ImageSource.camera)),
              // Text('Button'),
            ],
          ),
        ),
      ),
    );
  }

  Widget CustomButton({
    required String title,
    required IconData icon,
    required VoidCallback onClick,
  }) {
    return Container(
      width: 280,
      child: ElevatedButton(
        onPressed: onClick,
        child: Row(
          children: [
            Icon(Icons.image_outlined),
            SizedBox(
              width: 20,
            ),
            Text('Pick Image')
          ],
        ),
      ),
    );
  }
}
