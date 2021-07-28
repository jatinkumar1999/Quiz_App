import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz/views/home.dart';
import 'package:quiz/widget/widget.dart';

class Result extends StatefulWidget {
  final int total, correct, incorrect;
  Result(
      {@required this.total, @required this.correct, @required this.incorrect});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.correct}/${widget.total}',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
            Text(
              ' You Answered ${widget.correct} Correctly And  ${widget.incorrect} Incorrectly',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: button(context, 'Go to Home'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
