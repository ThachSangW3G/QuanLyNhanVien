import 'package:flutter/material.dart';

class ContentComponent extends StatefulWidget {
  final String title;
  final String content;
  const ContentComponent(
      {super.key, required this.title, required this.content});

  @override
  State<ContentComponent> createState() => _ContentComponentState();
}

class _ContentComponentState extends State<ContentComponent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          widget.content,
          style: const TextStyle(fontSize: 18),
        )
      ],
    ));
  }
}
