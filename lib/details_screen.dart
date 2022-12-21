import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/user_model.dart';

class DetailScreen extends StatelessWidget {
  final Model model;

  const DetailScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${model.title}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model.id.toString()),
            Text('${model.title}'),
            Text('${model.completed}'),
          ],
        ),
      ),
    );
  }
}