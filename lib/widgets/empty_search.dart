import 'package:flutter/material.dart';

class EmptySearch extends StatelessWidget {
  const EmptySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_rounded,
            size: 100,
            color: Color.fromARGB(255, 170, 176, 184),
          ),
          SizedBox(height: 10),
          Text(
            'Search For a Recipe',
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