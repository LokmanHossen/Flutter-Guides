import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuixz, {super.key});

  final void Function() startQuixz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(120, 255, 255, 255),
          ),
          //   Opacity(
          //   opacity: 0.6,
          //   child:Image.asset(
          //   'assets/images/quiz-logo.png',
          //   width: 300,
          // ),
          // ),
          const SizedBox(height: 50),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Color.fromARGB(255, 237, 223, 252),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: startQuixz,
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quize'),
          ),
        ],
      ),
    );
  }
}
