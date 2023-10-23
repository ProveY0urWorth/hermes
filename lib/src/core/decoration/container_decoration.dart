import 'package:flutter/material.dart';

class ContainerDecoration {
  static final darkDecoration = BoxDecoration(
    color: Colors.grey.shade800,
    borderRadius: const BorderRadius.all(
      Radius.circular(15),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );
}
