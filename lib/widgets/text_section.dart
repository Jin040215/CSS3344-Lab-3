import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String description;

  const TextSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
        style: const TextStyle(
          fontSize: 14,
          height: 1.5,
        ),
      ),
    );
  }
}
