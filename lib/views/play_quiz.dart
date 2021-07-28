import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz/modals/questionmodel.dart';
import 'package:quiz/services/database.dart';
import 'package:quiz/views/results.dart';
import 'package:quiz/widget/quiz_play.dart';
import 'package:quiz/widget/widget.dart';

class PlayQuiz extends StatefulWidget {
  final String quizid;
  PlayQuiz(this.quizid);

  @override
  _PlayQuizState createState() => _PlayQuizState();
}

int total = 0;
int notAttempted = 0;
int correct = 0;
int incorrect = 0;

class _PlayQuizState extends State<PlayQuiz> {
  QuerySnapshot questionsSnapshot;
  DataBaseMethods dataBaseMethods = DataBaseMethods();

  QuestionModel getQuestionModelFromDatasnapshot(
      DocumentSnapshot questionSnapshot) {
    QuestionModel questionModel = new QuestionModel();
    questionModel.question = questionSnapshot.data()['question'];
    List<String> options = [
      questionSnapshot.data()['option1'],
      questionSnapshot.data()['option2'],
      questionSnapshot.data()['option3'],
      questionSnapshot.data()['option4'],
    ];
    options.shuffle();
    questionModel.option1 = options[0];
    questionModel.option2 = options[1];
    questionModel.option3 = options[2];
    questionModel.option4 = options[3];
    questionModel.correctoption = questionSnapshot.data()['option1'];
    questionModel.ansWered = false;
    return questionModel;
  }

  @override
  void initState() {
    dataBaseMethods.getQuizQuestionData(widget.quizid).then((value) {
      setState(() {
        questionsSnapshot = value;
        correct = 0;
        incorrect = 0;
        notAttempted = questionsSnapshot.docs.length;
        total = questionsSnapshot.docs.length;
        print('$total');
      });
    });

    print(widget.quizid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: Colors.indigo[100],
        title: appBar(),
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, right: 3, top: 30),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: getresult(total, 'total'),
                  ),
                  Expanded(
                    flex: 4,
                    child: getresult(notAttempted, 'notAttempted'),
                  ),
                  Expanded(
                    flex: 3,
                    child: getresult(correct, 'correct'),
                  ),
                  Expanded(
                    flex: 3,
                    child: getresult(incorrect, 'incorrect'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            questionsSnapshot == null
                ? Container()
                : Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                    child: Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: questionsSnapshot.docs.length,
                            itemBuilder: (context, index) {
                              return QuizPlayTile(
                                questionModel: getQuestionModelFromDatasnapshot(
                                    questionsSnapshot.docs[index]),
                                index: index,
                              );
                            }),
                      ],
                    ),
                  ),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[200],
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Result(total: total, correct: correct, incorrect: incorrect),
            ),
          );
        },
        child: Text(
          "Result",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class QuizPlayTile extends StatefulWidget {
  final QuestionModel questionModel;
  final int index;

  QuizPlayTile({this.questionModel, this.index});

  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {
  String optionSelected = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
          Text(
            'Q${widget.index + 1}. ${widget.questionModel.question}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.ansWered) {
                if (widget.questionModel.option1 ==
                    widget.questionModel.correctoption) {
                  optionSelected = widget.questionModel.option1;
                  widget.questionModel.ansWered = true;
                  correct = correct + 1;
                  notAttempted = notAttempted - 1;
                  setState(() {});
                } else {
                  optionSelected = widget.questionModel.option1;
                  widget.questionModel.ansWered = true;
                  incorrect = incorrect + 1;
                  notAttempted = notAttempted - 1;
                  setState(() {});
                }
              }
            },
            child: OptionTile(
              correcrAnswer: widget.questionModel.correctoption,
              description: widget.questionModel.option1,
              option: 'A',
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.ansWered) {
                if (widget.questionModel.option2 ==
                    widget.questionModel.correctoption) {
                  optionSelected = widget.questionModel.option2;
                  widget.questionModel.ansWered = true;
                  correct = correct + 1;
                  notAttempted = notAttempted - 1;
                  setState(() {});
                } else {
                  optionSelected = widget.questionModel.option2;
                  widget.questionModel.ansWered = true;
                  incorrect = incorrect + 1;
                  notAttempted = notAttempted - 1;
                  setState(() {});
                }
              }
            },
            child: OptionTile(
              correcrAnswer: widget.questionModel.correctoption,
              description: widget.questionModel.option2,
              option: 'B',
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.ansWered) {
                if (widget.questionModel.option3 ==
                    widget.questionModel.correctoption) {
                  optionSelected = widget.questionModel.option3;
                  widget.questionModel.ansWered = true;
                  correct = correct + 1;
                  notAttempted = notAttempted - 1;
                  setState(() {});
                } else {
                  optionSelected = widget.questionModel.option3;
                  widget.questionModel.ansWered = true;
                  incorrect = incorrect + 1;
                  notAttempted = notAttempted - 1;
                  setState(() {});
                }
              }
            },
            child: OptionTile(
              correcrAnswer: widget.questionModel.correctoption,
              description: widget.questionModel.option3,
              option: 'C',
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.ansWered) {
                if (widget.questionModel.option4 ==
                    widget.questionModel.correctoption) {
                  optionSelected = widget.questionModel.option4;
                  widget.questionModel.ansWered = true;
                  correct = correct + 1;
                  notAttempted = notAttempted - 1;
                  setState(() {});
                } else {
                  optionSelected = widget.questionModel.option4;
                  widget.questionModel.ansWered = true;
                  incorrect = incorrect + 1;
                  notAttempted = notAttempted - 1;
                  setState(() {});
                }
              }
            },
            child: OptionTile(
              correcrAnswer: widget.questionModel.correctoption,
              description: widget.questionModel.option4,
              option: 'D',
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
