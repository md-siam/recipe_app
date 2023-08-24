import 'package:flutter/material.dart';

class LightLabel extends StatelessWidget {
  final String label;
  const LightLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 165, 166, 168),
      ),
    );
  }
}
