// ignore_for_file: prefer_typing_uninitialized_variables

import 'quiz2.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class MathQuizScreen extends StatefulWidget {
  const MathQuizScreen({super.key});

  @override
  State<MathQuizScreen> createState() => _MathQuizScreenState();
}

class _MathQuizScreenState extends State<MathQuizScreen> {
  List<String> questions = [
    "Q1: What's 10 + 1?",
    "Q2: What's 12 x 2?",
    "Q3: What's 15 - 1?",
    "Q4: What's 5 * 10?",
    "Q5: What's 2 + 15?",
  ];

  var questions_length = 0;

  List<Map> ans = [
    {
      "Q0": ["13", "11", "33", "24"]
    },
    {
      "Q1": ["101", "22", "83", "24"]
    },
    {
      "Q2": ["12", "14", "73", "22"]
    },
    {
      "Q3": ["10", "50", "36", "34"]
    },
    {
      "Q4": ["17", "62", "43", "44"]
    },
  ];
  var index = 0;
  bool check = true;
  var ans0;
  var ans1;
  var ans2;
  var ans3;
  var ans4;
  int quiz_1_marks = 0;
  void nextQuestion(int ans) {
    setState(() {
      var questions_length = questions.length;
      if (index == 0) {
        ans0 = ans;
        if (ans == 2) {
          quiz_1_marks = quiz_1_marks + 10;
        }
        index++;
      } else if (index == 1) {
        ans1 = ans;
        if (ans == 4) {
          quiz_1_marks = quiz_1_marks + 10;
        }
        index++;
      } else if (index == 2) {
        ans2 = ans;
        if (ans == 2) {
          quiz_1_marks = quiz_1_marks + 10;
        }
        index++;
      } else if (index == 3) {
        ans3 = ans;
        if (ans == 2) {
          quiz_1_marks = quiz_1_marks + 10;
        }
        index++;
      } else if (index == 4) {
        ans4 = ans;
        if (ans == 1) {
          quiz_1_marks = quiz_1_marks + 10;
        }
        check = false;
        print("result:");
        print("user ans to Q1 is $ans0");
        print("user ans to Q2 is $ans1");
        print("user ans to Q3 is $ans2");
        print("user ans to Q4 is $ans3");
        print("user ans to Q5 is $ans4");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: check
          ? Container(
              padding: const EdgeInsets.all(9.0),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(children: [
                LinearProgressBar(
                  maxSteps: questions.length,
                  progressType: LinearProgressBar.progressTypeLinear,
                  currentStep: index,
                  progressColor: Colors.pink,
                  backgroundColor: const Color.fromARGB(255, 158, 95, 116),
                ),
                Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            questions[index],
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 158, 95, 116)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //Here
                Column(children: [
                  ElevatedButton(
                      onPressed: () {
                        nextQuestion(1);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        textStyle: const TextStyle(fontSize: 25),
                        minimumSize: const Size(200, 50), // Set button size
                      ),
                      child: Text(ans[index]["Q$index"]![0])),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        nextQuestion(2);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        textStyle: const TextStyle(fontSize: 25),
                        minimumSize: const Size(200, 50), // Set button size
                      ),
                      child: Text(ans[index]["Q$index"]![1])),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        nextQuestion(3);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        textStyle: const TextStyle(fontSize: 25),
                        minimumSize: const Size(200, 50), // Set button size
                      ),
                      child: Text(ans[index]["Q$index"]![2])),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        nextQuestion(4);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        textStyle: const TextStyle(fontSize: 25),
                        minimumSize: const Size(200, 50), // Set button size
                      ),
                      child: Text(ans[index]["Q$index"]![3])),
                ]),
                const SizedBox(height: 60),
                DotsIndicator(
                  dotsCount: questions.length,
                  position: index,
                  decorator: const DotsDecorator(
                    color: Color.fromARGB(255, 158, 95, 116), // Inactive color
                    activeColor: Colors.pink,
                  ),
                ),
              ]),
            )

          //Result
          : Card(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.pink,
                      child: const Text(
                        "Quiz Result",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(20.2),
                      color: Colors.pink,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            questions[0],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            ans0.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(20.2),
                      color: Colors.pink,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            questions[1],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            ans1.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(20.2),
                      color: Colors.pink,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            questions[2],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            ans2.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(20.2),
                      color: Colors.pink,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            questions[3],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            ans3.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(20.2),
                      color: Colors.pink,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            questions[4],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            ans4.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Your score: ",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                        Text(
                          "$quiz_1_marks/50",
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GKQuizScreen(
                            quiz1marks: quiz_1_marks,
                          ),
                        ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        // color: Colors.pink,
                        child: const Text(
                          "Next Quiz",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
    ));
  }
}