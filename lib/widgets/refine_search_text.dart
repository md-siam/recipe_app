import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RefineSearchText extends StatelessWidget {
  final String firstString;
  final String secondString;
  const RefineSearchText({
    Key? key,
    required this.firstString,
    required this.secondString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstString,
          style: const TextStyle(
            fontSize: 11,
            color: Color.fromARGB(255, 103, 109, 116),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          secondString,
          style: const TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 103, 109, 116),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        SvgPicture.asset('asset/images/arrow_down.svg')
      ],
    );
  }
}
