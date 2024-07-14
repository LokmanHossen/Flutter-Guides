import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quize_app_advance/question_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    // int questionIndex = int.tryParse(itemData['question'].toString()) ?? 0;
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            // questionIndex: questionIndex,
            questionIndex: itemData['question_index'] as int,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'].toString(),
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Your Answer: ${itemData['user_answer']}',
                  // itemData['user_answer'].toString(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 202, 171, 252),
                  ),
                ),
                // Text(
                //   itemData['user_answer'] as String,
                //   style: const TextStyle(
                //     color: Color.fromARGB(255, 202, 171, 252),
                //   ),
                // ),
                Text(
                  'Correct Answer: ${itemData['correct_answer']}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 181, 254, 246),
                  ),
                ),
                // Text(
                //   itemData['correct_answer'] as String,
                //   style: const TextStyle(
                //     color: Color.fromARGB(255, 181, 254, 246),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
