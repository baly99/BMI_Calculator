import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  Color? blueGrayDark = Colors.blueGrey[900];
  final String gender;
  final double result;
  final int age;

  BmiResult(
    this.age,
    this.gender,
    this.result, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrayDark,
        title: const Text(
          'BMI RESULT',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text('Gender : ' + gender),

            ////////////
            text('Result : ${result.round()}'),

            //////////////
            text('Age : $age'),
          ],
        ),
      ),
    );
  }

  Text text(String str) {
    return Text(
      str,
      style: const TextStyle(
        fontSize: 24,
      ),
    );
  }
}
