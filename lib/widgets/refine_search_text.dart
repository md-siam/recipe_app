import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RefineSearchText extends StatelessWidget {
  const RefineSearchText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'REFINE SEARCH BY',
          style: TextStyle(
            fontSize: 11,
            color: Color.fromARGB(255, 103, 109, 116),
          ),
        ),
        const SizedBox(width: 5),
        const Text(
          'Calories, Diet, Ingredients',
          style: TextStyle(
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
