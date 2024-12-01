import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.7, 
            child: Image.asset('assets/images/quizimage.png',
              width: 300,
              height: 300,
            ),
          ),
          const SizedBox(height: 100),
          const Text('Let\'s start the quiz Nisal!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            }, 
            label: const Text('Start Quiz',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            icon: const Icon(
              Icons.arrow_right_outlined, 
              color: Color.fromARGB(255, 25, 12, 207),size: 30,
            ),
          )
        ],
      ),
    );
  }
}
