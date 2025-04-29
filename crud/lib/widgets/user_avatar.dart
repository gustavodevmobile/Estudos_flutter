import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UserAvatar extends StatefulWidget {
  final String name;
  UserAvatar(this.name, {super.key});

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  final picker = ImagePicker();
  File? _userAvatar;
  

  getImageUser(ImageSource source) async {
    final pickerFile = await picker.pickImage(source: source);
    setState(() {
      if (pickerFile != null) {
        _userAvatar = File(pickerFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue[100],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.grey[200],
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.grey[400],
                        backgroundImage:
                            _userAvatar != null ? FileImage(_userAvatar!) : null,
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 3,
                      width: 40,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 200,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              getImageUser(ImageSource.gallery);
                                              Navigator.pop(context);
                                            },
                                            child: Text('Galeria'),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              getImageUser(ImageSource.camera);
                                              Navigator.pop(context);
                                            },
                                            child: Text('Camera'),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(
                                                () {
                                                  _userAvatar = null;
                                                },
                                              );
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Remover',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.photo_camera, size: 25),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Text(widget.name, style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
