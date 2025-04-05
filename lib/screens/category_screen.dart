import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Quiz Category'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCategoryButton(
                context,
                'Geography of Nepal',
                'geography',
                Colors.blue,
                Icons.map,
              ),
              const SizedBox(height: 20),
              _buildCategoryButton(
                context,
                'About Nepal',
                'general',
                Colors.blue,
                Icons.info_outline,
              ),
              const SizedBox(height: 20),
              _buildCategoryButton(
                context,
                'Food',
                'food',
                Colors.blue,
                Icons.food_bank_sharp,
              ),
              const SizedBox(height: 20),
              _buildCategoryButton(
                context,
                'Culture & Traditions',
                'CT',
                Colors.blue,
                Icons.info_outline,
              ),
              const SizedBox(height: 20),
              _buildCategoryButton(
                context,
                'Sports & Adventure ',
                'SA',
                Colors.blue,
                Icons.sports,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(
    BuildContext context,
    String title,
    String category,
    Color color,
    IconData icon,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizScreen(category: category),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              color, // Set the background color based on the category
          iconColor: Colors.white, // Set icon color to white
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ), // Increase padding for better tap targets
        ),
        icon: Icon(icon), // Add icon to the button
        label: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
