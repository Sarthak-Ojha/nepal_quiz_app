import 'dart:math';
import 'package:logging/logging.dart';

class Question {
  final String id;
  final String questionText;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });
}

final List<Question> geographyQuestions = [
  Question(
    id: 'geo1',
    questionText: 'What is the height of Mount Everest?',
    options: ['8848', '8586', '8884', '8849'],
    correctAnswer: '8849',
  ),
  Question(
    id: 'geo2',
    questionText: 'Which is the longest river in Nepal?',
    options: ['Koshi', 'Gandaki', 'Karnali', 'Trisuli'],
    correctAnswer: 'Karnali',
  ),
  Question(
    id: 'geo3',
    questionText: 'Rara Lake is located in which province?',
    options: ['Karnali', 'Sudurpashchim', 'Gandaki', 'Bagmati'],
    correctAnswer: 'Karnali',
  ),
  Question(
    id: 'geo4',
    questionText: 'Which national park is famous for one-horned rhinoceros?',
    options: [
      'Bardiya National Park',
      'Chitwan National Park',
      'Langtang National Park',
      'Rara National Park',
    ],
    correctAnswer: 'Chitwan National Park',
  ),
  Question(
    id: 'geo5',
    questionText: 'Which is the deepest gorge in Nepal?',
    options: [
      'Kali Gandaki Gorge',
      'Arun Valley',
      'Budi Gandaki Gorge',
      'Trishuli Gorge',
    ],
    correctAnswer: 'Kali Gandaki Gorge',
  ),
  Question(
    id: 'geo6',
    questionText: 'What is the smallest district of Nepal by area?',
    options: ['Bhaktapur', 'Mustang', 'Lalitpur', 'Rasuwa'],
    correctAnswer: 'Bhaktapur',
  ),
  Question(
    id: 'geo7',
    questionText: 'Tilicho Lake is situated at what altitude?',
    options: ['3919 Meters', '4919 Meters', '5010 Meters', '4511 Meters'],
    correctAnswer: '4919 Meters',
  ),
  Question(
    id: 'geo8',
    questionText: 'Which of these is a transboundary river in Nepal?',
    options: ['Bagmati', 'Koshi', 'Karnali', 'Bheri'],
    correctAnswer: 'Koshi',
  ),
  Question(
    id: 'geo9',
    questionText: 'Which of these peaks is NOT in Nepal?',
    options: ['Makalu', 'K2', 'Annapurna', 'Lotse'],
    correctAnswer: 'K2',
  ),
  Question(
    id: 'geo10',
    questionText: 'What is the capital city of Lumbini Province?',
    options: ['Butwal', 'Dang', 'Rupandehi', 'Banke'],
    correctAnswer: 'Dang',
  ),
];

final List<Question> generalQuestions = [
  Question(
    id: 'gen1',
    questionText: 'What is the national flower of Nepal?',
    options: ['Marigold', 'Lotus', 'Rhododendron', 'Lily'],
    correctAnswer: 'Rhododendron',
  ),
  Question(
    id: 'gen2',
    questionText: 'Who was the first king of Nepal?',
    options: [
      'Prithivi Bir Shah',
      'Rajendra Shah',
      'Prithivi Narayan Shah',
      'Rajendra Bikram Shah',
    ],
    correctAnswer: 'Prithivi Narayan Shah',
  ),
  Question(
    id: 'gen3',
    questionText: 'What is the national language of Nepal?',
    options: ['Nepal bhasha', 'Nepali', 'Magar', 'Maithili'],
    correctAnswer: 'Nepali',
  ),
  Question(
    id: 'gen4',
    questionText: 'Which festival is known as the festival of lights in Nepal?',
    options: ['Tihar', 'Dashain', 'Holi', 'Teej'],
    correctAnswer: 'Tihar',
  ),
  Question(
    id: 'gen5',
    questionText: 'What animal is considered sacred in Nepal?',
    options: ['Tiger', 'Cow', 'Elephant', 'Monkey'],
    correctAnswer: 'Cow',
  ),
];

final List<Question> foodQuestions = [
  Question(
    id: 'food1',
    questionText: 'What is Nepal’s most popular traditional meal?',
    options: ['Momo', 'Dal Bhat', 'Chatamari', 'Thukpa'],
    correctAnswer: 'Dal Bhat',
  ),
  Question(
    id: 'food2',
    questionText: '"Samay Baji" is a special dish from which ethnic community',
    options: ['Tharu', 'Gurung', 'Newar', 'Tamang'],
    correctAnswer: 'Newar',
  ),
  Question(
    id: 'food3',
    questionText: 'What is the primary ingredient in "Sel Roti"?',
    options: ['Wheat flour', 'Rice flour', 'Lentil flour', 'Corn flour'],
    correctAnswer: 'Rice flour',
  ),
  Question(
    id: 'food4',
    questionText: 'Which food is commonly eaten during Dashain?',
    options: ['Biryani', 'Yomari', 'Sel Roti', 'Goat meat'],
    correctAnswer: 'Goat meat',
  ),
  Question(
    id: 'food5',
    questionText: 'What is "Chatamari" also known as?',
    options: [
      'Newari Pizza',
      'Tibetan Bread',
      'Rice Pancake',
      'Spicy Lentil Cake',
    ],
    correctAnswer: 'Newari Pizza',
  ),
  Question(
    id: 'food6',
    questionText: 'What is a common filling for Nepali momo?',
    options: ['Cheese', 'Meat & Vegetables', 'Sweet Beans', 'Fish'],
    correctAnswer: 'Meat & Vegetables',
  ),
  Question(
    id: 'food7',
    questionText: 'What is "Kwati"?',
    options: [
      'A type of bread',
      'A mixed bean soup',
      'A fermented rice dish',
      'A spicy curry',
    ],
    correctAnswer: 'A mixed bean soup',
  ),
  Question(
    id: 'food8',
    questionText: 'What is "Gundruk" made from?',
    options: ['Fermented vegetables', 'Rice', 'Fish', 'Lentils'],
    correctAnswer: 'Fermented vegetables',
  ),
];

final List<Question> cultureQuestions = [
  Question(
    id: 'culture1',
    questionText: 'What is the biggest festival of Nepalese Hindus?',
    options: ['Tihar', 'Holi', 'Dashain', 'Teej'],
    correctAnswer: 'Dashain',
  ),
  Question(
    id: 'culture2',
    questionText:
        'Which festival celebrates the bond between brothers and sisters?',
    options: ['Maghe Sankranti', 'Tihar', 'Chhath', 'Gai Jatra'],
    correctAnswer: 'Tihar',
  ),
  Question(
    id: 'culture3',
    questionText: 'Which Newar festival is known as the "festival of cows"?',
    options: ['Bisket Jatra', 'Indra Jatra', 'Gai Jatra', 'Holi'],
    correctAnswer: 'Gai Jatra',
  ),
  Question(
    id: 'culture4',
    questionText: 'What is the main dish of Dashain?',
    options: ['Momo', 'Samay Baji', 'Sel Roti', 'Goat meat & Dal Bhat'],
    correctAnswer: 'Goat meat & Dal Bhat',
  ),
  Question(
    id: 'culture5',
    questionText:
        'The Kumari is a living goddess worshipped mainly by which community?',
    options: ['Brahmin', 'Tharu', 'Newar', 'Gurung'],
    correctAnswer: 'Newar',
  ),
  Question(
    id: 'culture6',
    questionText: 'What is the traditional attire of Nepali men?',
    options: ['Saree', 'Daura Suruwal', 'Lungi', 'Kurta'],
    correctAnswer: 'Daura Suruwal',
  ),
  Question(
    id: 'culture7',
    questionText: 'Which province celebrates Maghi as their biggest festival?',
    options: ['Bagmati', 'Gandaki', 'Madhesh', 'Lumbini'],
    correctAnswer: 'Lumbini',
  ),
  Question(
    id: 'culture8',
    questionText: 'What is "Bhai Tika" part of?',
    options: ['Dashain', 'Tihar', 'Holi', 'Buddha Jayanti'],
    correctAnswer: 'Tihar',
  ),
  Question(
    id: 'culture9',
    questionText: 'Yomari Punhi is celebrated by which ethnic group?',
    options: ['Magar', 'Rai', 'Newar', 'Tharu'],
    correctAnswer: 'Newar',
  ),
  Question(
    id: 'culture10',
    questionText: 'Which dance is performed in Indra Jatra?',
    options: ['Lakhe Dance', 'Maruni Dance', 'Deuda Dance', 'Ghatu Dance'],
    correctAnswer: 'Lakhe Dance',
  ),
];

final List<Question> sportsQuestions = [
  Question(
    id: 'sports1',
    questionText:
        'Who was the first Nepali cricketer to play in the Indian Premier League (IPL)?',
    options: [
      'Paras Khadka',
      'Sandeep Lamichhane',
      'Gyanendra Malla',
      'Sharad Vesawkar',
    ],
    correctAnswer: 'Sandeep Lamichhane',
  ),
  Question(
    id: 'sports2',
    questionText: 'What is the national sport of Nepal?',
    options: ['Cricket', 'Football', 'Volleyball', 'Kabaddi'],
    correctAnswer: 'Volleyball',
  ),
  Question(
    id: 'sports3',
    questionText: 'Who was the first female Nepali to summit Mount Everest?',
    options: [
      'Tenzing Norgay',
      'Pasang Lhamu Sherpa',
      'Kami Rita Sherpa',
      'Babu Chiri Sherpa',
    ],
    correctAnswer: 'Pasang Lhamu Sherpa',
  ),
  Question(
    id: 'sports4',
    questionText: 'Which region is famous for paragliding in Nepal?',
    options: ['Everest', 'Lumbini', 'Pokhara', 'Rara'],
    correctAnswer: 'Pokhara',
  ),
  Question(
    id: 'sports5',
    questionText: 'Which team won the 1st edition of the Nepal Premier League?',
    options: [
      'Sudur Paschim Royals',
      'Karnali Bulls',
      'Janakpur Bolts',
      'Chitwan Rhinos',
    ],
    correctAnswer: 'Janakpur Bolts',
  ),
];

final Map<String, List<Question>> quizCategories = {
  'geography': geographyQuestions,
  'general': generalQuestions,
  'food': foodQuestions,
  'CT': cultureQuestions,
  'SA': sportsQuestions,
};

// Create a logger instance
final Logger logger = Logger('QuizApp');

// Function to shuffle the questions in each category
void shuffleQuestions() {
  quizCategories.forEach((category, questions) {
    questions.shuffle(Random()); // Shuffle the questions for each category
  });
}

void main() {
  // Shuffle the questions when the quiz starts
  shuffleQuestions();

  // Log the randomized questions for each category
  quizCategories.forEach((category, questions) {
    logger.info('Category: $category');
    for (var question in questions) {
      logger.info(question.questionText);
    }
    logger.info('\n');
  });
}
