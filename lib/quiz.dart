import 'package:daytwo/auth.dart';
import 'package:daytwo/data/questions.dart';
import 'package:daytwo/question_screen.dart';
import 'package:daytwo/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(changeScreen);
  //   super.initState();
  // }

  // ternary operator -> true ? what should be ? else what should be

  var activeScreen = 'auth_screen';

  void changeScreen() {
    setState(() {
      activeScreen = 'question_screen';
    });
  }

  List<String> selectedAnswers = [];

  void choosenAnswers(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'start_screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(changeScreen);

    if (activeScreen == 'question_screen') {
      screen = QuestionScreen(
        onSelectAnswer: choosenAnswers,
      );
    }
    if (activeScreen == 'auth_screen') {
      screen = const Auth();
    }

    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 3, 92, 244),
          Color.fromARGB(255, 185, 221, 250)
        ])),
        // child: activeScreen,

        // ternary operator
        // child: activeScreen == 'start_screen'
        //   ? StartScreen(changeScreen)
        //   : const QuestionScreen(),

        child: screen,
      ),
    ));
  }
}
