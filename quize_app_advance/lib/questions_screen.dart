import 'package:flutter/material.dart';
import 'package:quize_app_advance/answer_button.dart';

import 'data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 30),
          AnswerButton(
            answerText: currentQuestion.answer[0],
            onTap: () {},
          ),
          AnswerButton(
            answerText: currentQuestion.answer[1],
            onTap: () {},
          ),
          AnswerButton(
            answerText: currentQuestion.answer[2],
            onTap: () {},
          ),
           AnswerButton(
            answerText: currentQuestion.answer[3],
            onTap: () {},
          )
        ],
      ),
    );
  }
}
