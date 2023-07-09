import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResultScreen extends StatefulWidget {
  String text;

  ResultScreen({super.key, required this.text});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  static final validCharacters = RegExp(r'^[a-zA-Z]+$');

  saveNumber(BuildContext context) async {
    await FirebaseFirestore.instance
        .collection('Numbers')
        .doc(DateTime.now().toString())
        .set({'number': widget.text});
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    widget.text = widget.text
        .replaceAll('o', '0')
        .replaceAll('O', '0')
        .replaceAll(' ', '')
        .replaceAll('l', '1')
        .replaceAll('j', '9')
        .replaceAll('q', '9')
        .replaceAll('g', '9');
    print(validCharacters.hasMatch(widget.text));
    b = !validCharacters.hasMatch(widget.text);
    print(b);
    print(widget.text);
  }

  bool b = true;

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        actions: [
          b &&
                  widget.text.trim().length == 10 &&
                  (widget.text.startsWith('9') ||
                      widget.text.startsWith('8') ||
                      widget.text.startsWith('7'))
              ? ElevatedButton(
                  onPressed: () {
                    saveNumber(context);
                  },
                  child: const Text('Save'))
              : Container()
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(30.0),
              child: b &&
                      widget.text.trim().length == 10 &&
                      (widget.text.startsWith('9') ||
                          widget.text.startsWith('8') ||
                          widget.text.startsWith('7'))
                  ? Text(
                      widget.text,
                      style: textStyle,
                    )
                  : Text(
                      'Invalid Number or Scan Properly',
                      style: textStyle,
                    ),
            ),
          ),
        ],
      ));

  var textStyle = TextStyle(fontSize: 25);
}
