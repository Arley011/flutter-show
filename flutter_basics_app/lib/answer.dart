import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final Function selectHendler;
  final String answerText;

  Answer(this.selectHendler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.tealAccent,
        textColor: Colors.deepOrange,
        child: Text(answerText),
        onPressed: selectHendler,
      ),
    );
  }
}
