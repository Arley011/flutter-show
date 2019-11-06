import 'package:flutter/material.dart';
import 'package:flutter_basics_app/result.dart';

import './quiz.dart';

//void main(){
//  runApp(AnApp());
void main() => runApp(AnApp());

class AnApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnAppState();
  }
}

class _AnAppState extends State<AnApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 4},
        {'text': 'Red', 'score': 3},
        {'text': 'Grey', 'score': 8}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Dog', 'score': 4},
        {'text': 'Cat', 'score': 1},
        {'text': 'Snake', 'score': 10},
        {'text': 'Lion', 'score': 7}
      ],
    },
    {
      'questionText': 'What\'s your favorite country?',
      'answers': [
        {'text': 'Ukraine', 'score': 1},
        {'text': 'US', 'score': 3},
        {'text': 'India', 'score': 7},
        {'text': 'Russia', 'score': 10}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore =0;
    });
  }

  void _question(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _question,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
