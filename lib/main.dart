import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImagePicker(),
    );
  }
}

class ImagePicker extends StatefulWidget {
  const ImagePicker({Key? key}) : super(key: key);

  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  pickFile();
                },
                child: const Text("Pick File"),
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pickFile() async {
    result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    if (result == null) return;
    final file = result!.files.first;
    openFile(file);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}
