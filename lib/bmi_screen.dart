import 'dart:math';

import 'package:bmi_calculator/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double sliderInitialValue = 20.0;
  int ageInitialValue = 20;
  int weightInitialValue = 60;
  bool isMale = true;

  Color? blueGrayDark = Colors.blueGrey[900];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrayDark,
        title: const Text(
          'BMI CALCULATOR',
        ),
        centerTitle: true,
      ),

      /********* body ********* */
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  genderType(
                    icon: Icons.male,
                    gender: 'Male',
                    fun: () {
                      isMale = true;
                    },
                    isMale: isMale,
                  ),
                  genderType(
                    icon: Icons.female,
                    gender: 'Female',
                    fun: () {
                      isMale = false;
                    },
                    isMale: !isMale,
                  ),
                ],
              ),
            ),

            /************************** */
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: silder(),
                  decoration: BoxDecoration(
                    color: blueGrayDark,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            /************************** */
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      floatActionButton(
                        str: 'Age',
                        value: ageInitialValue,
                        fun: (bool x) => setState(() {
                          x ? ++ageInitialValue : --ageInitialValue;
                          print(ageInitialValue);
                        }),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      floatActionButton(
                        str: 'Weight',
                        value: weightInitialValue,
                        fun: (bool x) => setState(() {
                          x ? ++weightInitialValue : --weightInitialValue;
                          print(weightInitialValue);
                        }),
                      ),

                      /******************* */
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  // color: blueGrayDark,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            /************************** */
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.blue,
              // height: 50,
              child: MaterialButton(
                onPressed: () {
                  double result =
                      weightInitialValue / pow(sliderInitialValue / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BmiResult(
                          ageInitialValue, isMale ? 'Male' : 'Female', result),
                    ),
                  );
                  print(result.round());
                },
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget floatActionButton({
    required String str,
    required int value,
    required Function fun,
  }) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              str,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            ////////////////
            const SizedBox(
              height: 10,
            ),
            ////////////////

            Text(
              '$value',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),

            ////////////////
            const SizedBox(
              height: 10,
            ),
            ////////////////

            /******************* */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: str + '-',
                  onPressed: () {
                    fun(false);

                    // setState(() {});
                  },
                  child: const Icon(Icons.remove),
                  mini: true,
                ),
                ////////////////
                const SizedBox(
                  width: 10,
                ),
                ////////////////
                FloatingActionButton(
                  heroTag: str + '+',
                  onPressed: () {
                    fun(true);

                    // setState(() {});
                  },
                  child: const Icon(Icons.add),
                  mini: true,
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: blueGrayDark,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Column silder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Height',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        //////////////////
        const SizedBox(
          height: 10,
        ),
        /////////////////////
        Row(
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${sliderInitialValue.round()}',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            /////////////////
            const Text(
              'CM',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),

        Slider(
          value: sliderInitialValue,
          min: 0,
          max: 400,
          onChanged: (value) {
            sliderInitialValue = value;
            setState(() {});
          },
        ),
      ],
    );
  }

  Expanded genderType({
    required bool isMale,
    required IconData icon,
    required String gender,
    required Function fun,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              fun();
            });
          },
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 60,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  gender,
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: isMale ? Colors.blue : blueGrayDark,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
