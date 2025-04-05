import 'package:flutter/material.dart';
import 'category_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate the percentage for the result message
    double percentage = (score / totalQuestions) * 100;
    String resultMessage;

    // Provide feedback based on score
    if (percentage >= 80) {
      resultMessage = 'Excellent!';
    } else if (percentage >= 50) {
      resultMessage = 'Good job!';
    } else {
      resultMessage = 'Better luck next time!';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display an icon with some padding
              const Icon(Icons.emoji_events, size: 80, color: Colors.amber),
              const SizedBox(height: 20),

              // Display Quiz Complete Message
              Text(
                'Quiz Complete!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 20),

              // Display the result message based on the score
              Text(
                resultMessage,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),

              // Display the score in a nice format
              Text(
                'You got $score out of $totalQuestions correct!',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),

              // Display the score percentage in a larger font
              Text(
                'Score: ${(percentage).toStringAsFixed(1)}%',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color:
                      percentage >= 80
                          ? Colors.green
                          : percentage >= 50
                          ? Colors.orange
                          : Colors.red,
                ),
              ),
              const SizedBox(height: 30),

              // Retry button with added customization
              ElevatedButton(
                onPressed: () {
                  _navigateToCategoryScreen(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  'Try Another Quiz',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),

              // Back to Home button, if needed
              TextButton(
                onPressed: () {
                  _navigateToCategoryScreen(context);
                },
                child: const Text(
                  'Back to Quiz Categories',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to navigate to the CategoryScreen
  void _navigateToCategoryScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CategoryScreen()),
    );
  }
}
