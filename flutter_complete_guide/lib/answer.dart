import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHeader;
  final String answerText;

  Answer(this.selectHeader, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: selectHeader,
        child: Text(answerText),
      ),
    );
  }
}
