import 'package:flutter/material.dart';

class PageDetail extends StatelessWidget {
  final photos;

  PageDetail({required this.photos});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(photos.title),
          Text(photos.description),
        ],
      ),
    );
  }
}
