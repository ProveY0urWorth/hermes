import 'package:flutter/material.dart';

class TextStyler {
  static const TextStyle link =
      TextStyle(color: Colors.lightBlueAccent, fontSize: 18.0);

  static const TextStyle regular = TextStyle(fontSize: 16.0);
  static const TextStyle large = TextStyle(fontSize: 18.0);
  static const TextStyle bold = TextStyle(fontWeight: FontWeight.bold);
  static const TextStyle largeBold =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  static const TextStyle error = TextStyle(color: Colors.redAccent);
}
