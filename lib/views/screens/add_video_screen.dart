import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/views/screens/confirm_screen.dart';

class AddVideoScreen extends StatefulWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  @override
  State<AddVideoScreen> createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends State<AddVideoScreen> {
  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ConfirmScreen(
                videoFile: File(video.path),
                videoPath: video.path,
              )));
    }
  }

  showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              SimpleDialogOption(
                onPressed: () {
                  pickVideo(ImageSource.gallery, context);
                },
                child: Row(children: [
                  Icon(Icons.image),
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: Text(
                      'Gallery',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ]),
              ),
              SimpleDialogOption(
                onPressed: () {
                  pickVideo(ImageSource.camera, context);
                },
                child: Row(children: [
                  Icon(Icons.camera_alt),
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: Text(
                      'Camera',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ]),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Row(children: [
                  Icon(Icons.cancel),
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ]),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          showOptionsDialog(context);
        },
        child: Text('add video'),
      )),
    );
  }
}
