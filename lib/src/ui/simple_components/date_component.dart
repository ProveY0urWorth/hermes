import 'package:flutter/material.dart';
import 'package:hermes/src/core/styles/text_styles.dart';
import 'package:intl/intl.dart';

class DateComponent extends StatelessWidget {
  const DateComponent({super.key, required this.datetime});
  final DateTime datetime;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat('HH:mm dd.MM.yyyy').format(datetime).toString(),
      style: TextStyler.large,
    );
  }
}
