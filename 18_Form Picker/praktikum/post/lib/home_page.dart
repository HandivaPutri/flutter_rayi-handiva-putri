import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

DateTime _dueDate = DateTime.now();
final currentDate = DateTime.now();
Color _currentColor = Colors.orange;

TextEditingController controllerCaption = TextEditingController();

class _HomePageState extends State<HomePage> {
  File? filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            // buildFilePicker
            buildFilePicker(),
            // buildDatePicker
            buildDatePicker(context),
            SizedBox(
              height: 20,
            ),
            // buildColorPicker
            buildColorPicker(context),
            // buildCaption
            buildCaption(context),
            ElevatedButton(
                onPressed: () {
                  if (filePath != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Result(filePath: filePath!),
                      ),
                    );
                  }
                },
                child: Text("Sumbit")),
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Publish At',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(currentDate.year + 5),
                );

                setState(() {
                  if (selectDate != null) {
                    _dueDate = selectDate;
                  }
                });
              },
              child: const Text('Select'),
            ),
          ],
        ),
        // Text(
        //   DateFormat('dd-MM-yyy').format(_dueDate),
        //   style: TextStyle(
        //     fontSize: 14,
        //   ),
        // ),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color Theme',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: _currentColor,
        ),
        SizedBox(
          height: 5,
        ),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_currentColor),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Pick Your Color'),
                    content: BlockPicker(
                      pickerColor: _currentColor,
                      onColorChanged: (color) {
                        setState(() {
                          _currentColor = color;
                        });
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Save'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Pick Color'),
          ),
        ),
      ],
    );
  }

  Widget buildFilePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cover',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _pickFile();
            },
            child: Text('Pilih File'),
          ),
        ),
      ],
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      filePath = File(result.files.first.path.toString());
    });

    // // Mendapatkan file dari object result
    // final file = result.files.first;
    // _openFile(file);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  Widget buildCaption(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Caption',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            maxLines: 7,
            controller: controllerCaption,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

class Result extends StatelessWidget {
  Result({super.key, required this.filePath});

  final File filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview Post"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Container(
            child: Image.file(filePath),
            height: 500,
            width: 500,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Published"),
                Text("${_dueDate.toLocal()}".split(' ')[0]),
                SizedBox(
                  width: 120,
                ),
                Text("Color : "),
                Container(
                  height: 17,
                  width: 17,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: _currentColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
            width: 20,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              maxLines: 7,
              controller: controllerCaption,
            ),
          ),
        ],
      ),
    );
  }
}
