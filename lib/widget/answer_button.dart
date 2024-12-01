import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {

  const AnswerButton({super.key, required this.answerText, required this.onTap});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 222, 235, 245),
          foregroundColor: const Color.fromARGB(255, 2, 1, 35)
        ),
        onPressed: onTap, 
        child: Text(answerText))
    ;
  }
}
