import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'quiz_screen.dart';

class displayResult extends StatefulWidget {
  final int quiz_1_marks;
  final int quiz_2_marks;
  const displayResult(
      {super.key, required this.quiz_1_marks, required this.quiz_2_marks});

  @override
  State<displayResult> createState() => _displayResultState();
}

class _displayResultState extends State<displayResult> {

  @override
  Widget build(BuildContext context) {
    int marks = widget.quiz_1_marks + widget.quiz_2_marks;
    double percentage = (marks / 100) * 100;
    return 
        SafeArea(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Your overall score is : ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
                Text(
                  "$marks/150",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Percentage : ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 5.0,
              percent: 1.0,
              center: Text("$percentage",
                  style: const TextStyle(
                    color: Colors.pink,
                  )),
              progressColor: Colors.pink,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MathQuizScreen(),
                ));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                // color: Colors.pink,
                child: const Text(
                  "Restart",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}