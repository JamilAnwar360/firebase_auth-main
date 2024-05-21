import 'dart:io';

import 'package:auth_firebase/src/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class report_missing_item extends StatefulWidget {
  const report_missing_item({Key? key}) : super(key: key);

  @override
  _ReportMissingItemState createState() => _ReportMissingItemState();
}

class _ReportMissingItemState extends State<report_missing_item> {
  String _personName = '';
  String _description = '';
  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _submitReport() {
    // Implement logic to send data to backend
    // You can use HTTP package or other libraries to make API calls
    print('Person Name: $_personName');
    print('Description: $_description');
    // You can also handle image upload here using _image
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Missing Person'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please provide information about the missing person:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(labelText: 'Description'),
              onChanged: (value) {
                setState(() {
                  _description = value;
                });
              },
              maxLines: 3,
            ),
            SizedBox(height: 20),
            _image != null
                ? Image.file(
              _image!,
              width: 100,
              height: 100,
            )
                : Container(),
            ElevatedButton(
              onPressed: getImage,
              child: Text('Upload Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _submitReport();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Submit Report'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: report_missing_item(),
  ));
}
