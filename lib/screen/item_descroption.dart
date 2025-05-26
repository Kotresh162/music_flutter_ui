import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RespectivePage extends StatelessWidget {
  final String title;
  final String description;

  const RespectivePage(this.title, this.description, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(description, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
