import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: summaryData.map((data) {
            final userAnswer = data['user_answer'] as String;
            final correctAnswer = data['correct_answer'] as String;
            return Row(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: userAnswer == correctAnswer
                      ? Colors.tealAccent
                      : Colors.pinkAccent,
                  child: Text(((data['question_index'] as int) + 1).toString()),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Your answer: $userAnswer",
                        style: TextStyle(
                          fontSize: 15,
                          color: userAnswer == correctAnswer
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      Text(
                        "Correct answer: $correctAnswer",
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
