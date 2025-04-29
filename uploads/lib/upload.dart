import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
import 'package:uploads/exemplo_doc.dart';

class UploadImages extends StatefulWidget {
  const UploadImages({super.key});

  @override
  State<UploadImages> createState() => _UploadImagesState();
}

class _UploadImagesState extends State<UploadImages> {
  File? _image;
  File? _camera;
  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxHeight: 300,
        maxWidth: 300);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('Imagem não escolhida.');
        _image = null;
      }
    });
  }

  Future getImageCamera() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        maxHeight: 200,
        maxWidth: 200);
    setState(() {
      if (pickedFile != null) {
        _camera = File(pickedFile.path);
      } else {
        print('Imagem não escolhida.');
        _camera = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aprendendo Upload de Imagens'),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center, //x
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 170,
                        height: 200,
                        decoration: BoxDecoration(color: Colors.black12),
                        child: _camera != null
                            ? Image.file(_camera!)
                            : Center(
                                child: Icon(Icons.add_photo_alternate),
                              ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          getImageCamera();
                        },
                        child: Text('Camera'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 170,
                        height: 200,
                        decoration: BoxDecoration(color: Colors.black12),
                        child: _image != null
                            ? Image.file(_image!.absolute)
                            : Center(
                                child: Icon(Icons.add_photo_alternate),
                              ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          getImageGallery();
                        },
                        child: Text('Galeria'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExemploDaDocumentacao(),),);
              },
              child: Text('Ir para exemplo da documentação'),
            ),
          ],
        ),
      ),
    );
  }
}
