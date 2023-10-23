import 'package:flutter/material.dart';
import 'package:hermes/src/core/styles/text_styles.dart';

class TextWithLabel extends StatelessWidget {
  const TextWithLabel({super.key, required this.label, required this.text});
  final String label;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(style: TextStyler.regular, children: [
      TextSpan(text: label, style: TextStyler.bold),
      TextSpan(text: text)
    ]));
  }
}
