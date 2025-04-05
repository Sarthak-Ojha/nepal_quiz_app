import 'package:flutter/material.dart';
import 'result_screen.dart';
// Fix the import path to match your project structure
import 'package:nepal_quiz_app/models/question.dart'; // If question.dart is in the same directory as quiz_screen.dart
// OR
// import 'package:nepal_quiz_app/question.dart'; // If it's in the root of your lib folder
import 'category_screen.dart';

class QuizScreen extends StatefulWidget {
  final String category;

  const QuizScreen({super.key, required this.category});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  late List<Question> _questions;
  String _feedbackMessage = '';
  bool _isAnswerSelected = false;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  void _loadQuestions() {
    try {
      debugPrint('Loading questions for category: ${widget.category}');

      final categories = quizCategories;
      _questions = categories[widget.category] ?? [];

      if (_questions.isEmpty) {
        throw Exception('No questions available for this category');
      }
    } catch (e) {
      debugPrint('Error loading questions: $e');
      setState(() {
        _hasError = true;
        _feedbackMessage = 'Error: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _answerQuestion(bool isCorrect) {
    if (_isAnswerSelected) return;

    setState(() {
      _isAnswerSelected = true;
      _feedbackMessage = isCorrect ? 'Correct!' : 'Incorrect';
      if (isCorrect) {
        _score++;
      }
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return; // Check if widget is still mounted

      setState(() {
        _isAnswerSelected = false;
        _feedbackMessage = '';
        if (_currentQuestionIndex < _questions.length - 1) {
          _currentQuestionIndex++;
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder:
                  (context) => ResultScreen(
                    score: _score,
                    totalQuestions: _questions.length,
                  ),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const CategoryScreen()),
            );
          },
        ),
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _hasError || _questions.isEmpty
              ? _buildErrorScreen()
              : _buildQuizScreen(),
    );
  }

  Widget _buildErrorScreen() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 60, color: Colors.red),
            const SizedBox(height: 20),
            Text(
              _feedbackMessage,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoryScreen(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text('Return to Categories'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizScreen() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                _questions[_currentQuestionIndex].questionText,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 30),

          if (_feedbackMessage.isNotEmpty)
            Text(
              _feedbackMessage,
              style: TextStyle(
                fontSize: 18,
                color:
                    _feedbackMessage == 'Correct!' ? Colors.green : Colors.red,
              ),
            ),
          const SizedBox(height: 20),
          ..._buildAnswerButtons(),
          const SizedBox(height: 20),
          Text(
            'Question ${_currentQuestionIndex + 1}/${_questions.length}',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAnswerButtons() {
    return _questions[_currentQuestionIndex].options.map((option) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed:
                _isAnswerSelected
                    ? null
                    : () => _answerQuestion(
                      option == _questions[_currentQuestionIndex].correctAnswer,
                    ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor:
                  _isAnswerSelected
                      ? (option ==
                              _questions[_currentQuestionIndex].correctAnswer
                          ? Colors.green
                          : Colors.red)
                      : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(option, style: const TextStyle(fontSize: 16)),
            ),
          ),
        ),
      );
    }).toList();
  }
}
