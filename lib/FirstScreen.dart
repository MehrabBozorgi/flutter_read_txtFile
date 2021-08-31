import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var value;
  var _openResult = 'Unknown';

  Future<void> openFile() async {
    var filePath = r'/storage/emulated/0/update.apk';

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'],
    );
    if (result != null) {
      filePath = result.files.single.path!;
    }
    final _result = await OpenFile.open(filePath);
    print(
        '====================================================================');
    print(_result.toString());

    setState(() {
      _openResult = "type=${_result.type}  message=${_result.message}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: IconButton(
                icon: Icon(
                  Icons.list,
                  size: 50,
                ),
                onPressed: () async {},
              ),
            ),

            Text('open result: $_openResult\n'),
            TextButton(
              child: Text('Tap to open file'),
              onPressed: openFile,
            ),

            // Text('_result.toString()')
            // _result == null
            //     ? Text('Empty')
            //     :  Text(result.toString())
          ],
        ),
      ),
    );
  }
}
