import 'package:flutter/material.dart';

class ErrorSearch extends StatelessWidget {
  const ErrorSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 100,
            color: Color.fromARGB(255, 170, 176, 184),
          ),
          SizedBox(height: 10),
          Text(
            'Error Search',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 170, 176, 184),
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
