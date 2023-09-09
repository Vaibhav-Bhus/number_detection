// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  String text;

  ResultScreen({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Text(
                  '${widget.text}',
                ),
              ),
            ),
          ),
        ],
      ));
}
