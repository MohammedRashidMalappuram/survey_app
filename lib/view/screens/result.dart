import 'package:flutter/material.dart';
import 'package:new_wey/list_data.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
            child: Text(
          '$values',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
