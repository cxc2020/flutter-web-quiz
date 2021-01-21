import 'package:flutter/foundation.dart';

class Pro extends ChangeNotifier {
  String correct = '';
  int qalad = 0, sax = 0;
  getTapped(String value) {
    correct = value;

    notifyListeners();
  }

  int answersLeft = 1;
  int ansersleft1 = 1;
  getAnswer(int answer) {
    if (answer == 1) {
      sax = sax + 1;
      answersLeft = answersLeft + 1;
      ansersleft1 = ansersleft1 + 1;
      if (answersLeft > Quiz.allQuiz.length) {
        answersLeft = 1;
        ansersleft1 = Quiz.allQuiz.length + 1;
      }
    } else {
      answersLeft = answersLeft + 1;
      ansersleft1 = ansersleft1 + 1;
      if (answersLeft > Quiz.allQuiz.length) {
        answersLeft = 1;
        ansersleft1 = Quiz.allQuiz.length + 1;
      }
      qalad = qalad + 1;
    }

    notifyListeners();
  }

  int current = 0;
  next() {
    current++;
    if (current >= Quiz.allQuiz.length) {
      current = 0;
    }
    notifyListeners();
  }
}

class Quiz {
  final String question;
  final String correctAnswer;
  final List answer;
  Quiz({this.answer, this.question, this.correctAnswer});
  static List<Quiz> allQuiz = [
    Quiz(
        answer: [
          "Android is a Car Parts",
          "Android is an operating system",
          "Android is for apple devices"
        ],
        question: "What is Android?",
        correctAnswer: "Android is an operating system"),
    Quiz(
        answer: [
          "MySql is non relational database",
          "MySql is a relational database",
          "MySql is not a database"
        ],
        question: "What is MySql?",
        correctAnswer: "MySql is a relational database"),
    Quiz(
        answer: [
          "Lambarka cabdirisaaq waa 061553428",
          "Lambarka cabdirisaaq waa 061553424",
          "Lambarka cabdirisaaq waa 061592834"
        ],
        question: "lambarka cabdirisaaq?",
        correctAnswer: "Lambarka cabdirisaaq waa 061592834"),
    Quiz(
        answer: [
          "Firebase was bought by Facebook",
          "Firebase was bought by Google",
          "Firebase was bought by Youtube"
        ],
        question: "Who bought Firebase?",
        correctAnswer: "Firebase was bought by Google"),
    Quiz(
        answer: [
          "Firebase is a cloud based service",
          "Firebase is a sql database",
          "Firebase is an IDE "
        ],
        question: "What is Firebase?",
        correctAnswer: "Firebase is a cloud based service"),
    Quiz(
        answer: [
          "intent is used to Turn off cellphone",
          "intent is used to communicate with android componnets",
          "intent is used only for opening activities"
        ],
        question: "what is intent?",
        correctAnswer: "intent is used to communicate with android componnets"),
    Quiz(
        answer: [
          "Lolipop is a version name for ios 10",
          "Lolipop is a version name for android 6",
          "Lolipop is a version name for Windows 7"
        ],
        question: "What is Lolipop?",
        correctAnswer: "Lolipop is a version name for android 6"),
    Quiz(
        answer: [
          "Table consists of rows and columns",
          "Table is a storage for a database",
          "Database deos\'t have a Table"
        ],
        question: "What is A Table?",
        correctAnswer: "Table consists of rows and columns"),
    Quiz(
        answer: [
          "Google drive is a internet provider",
          "Google drive is car owned by google",
          "Google drive is a cloud storage"
        ],
        question: "what is google dive?",
        correctAnswer: "Google drive is a cloud storage"),
    Quiz(answer: [
      "Flutter is a programming language",
      "Flutter is a search engine",
      "Flutter is a framework"
    ], question: "What is Flutter?", correctAnswer: "Flutter is a framework"),
    Quiz(
        answer: ["1", "2", "3 "],
        question: "Just pick a number?",
        correctAnswer: "1"),
    Quiz(
        answer: [
          "Modern University For Science And Technology",
          "intent is used to communicate with android componnets",
          "intent is used only for opening activities"
        ],
        question: "what deos Must is short for?",
        correctAnswer: "Modern University For Science And Technology"),
  ];
}
