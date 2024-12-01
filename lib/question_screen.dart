import 'package:daytwo/widget/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:daytwo/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void changeQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffleAnswers().map((option) {
              return AnswerButton(
                answerText: option,
                onTap: () {
                  changeQuestion(option);
                },
              );
            })
            // AnswerButton(answerText: currentQuestion.options[0], onTap: () {}),
            // AnswerButton(answerText: currentQuestion.options[1], onTap: () {}),
            // AnswerButton(answerText: currentQuestion.options[2], onTap: () {}),
            // AnswerButton(answerText: currentQuestion.options[3], onTap: () {}),
          ],
        ));
  }
}
