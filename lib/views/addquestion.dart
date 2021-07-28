import 'package:flutter/material.dart';
import 'package:quiz/services/database.dart';
import 'package:quiz/widget/widget.dart';

class AddQuestion extends StatefulWidget {
  final String quizId;
  AddQuestion(this.quizId);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final formkey = GlobalKey<FormState>();
  String question, option1, option2, option3, option4;
  bool isloading = false;

  uploaQuestion() {
    setState(() {
      isloading = true;
    });
    if (formkey.currentState.validate()) {
      Map<String, String> addData = {
        'question': question,
        'option1': option1,
        'option2': option2,
        'option3': option3,
        'option4': option4,
      };

      DataBaseMethods().addQuizQuestion(widget.quizId, addData).then((value) {
        setState(() {
          isloading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          title: appBar(),
        ),
        body: isloading
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(30.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 20.0,
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                  offset: Offset(0, 6),
                                ),
                              ]),
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextFormField(
                                    validator: (value) => value.isEmpty
                                        ? "enter a question"
                                        : null,
                                    onChanged: (value) {
                                      setState(() {
                                        question = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "question",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextFormField(
                                    validator: (value) => value.isEmpty
                                        ? "enter a option1 "
                                        : null,
                                    onChanged: (value) {
                                      setState(() {
                                        option1 = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "option1  (correct option)",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextFormField(
                                    validator: (value) => value.isEmpty
                                        ? "enter a option2"
                                        : null,
                                    onChanged: (value) {
                                      setState(() {
                                        option2 = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "option2",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextFormField(
                                    validator: (value) => value.isEmpty
                                        ? "enter a option3"
                                        : null,
                                    onChanged: (value) {
                                      setState(() {
                                        option3 = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "option3",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextFormField(
                                    validator: (value) => value.isEmpty
                                        ? "enter a option4"
                                        : null,
                                    onChanged: (value) {
                                      setState(() {
                                        option4 = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "option4",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: button(context, 'Submit'))),
                            SizedBox(width: 20.0),
                            Expanded(
                                child: GestureDetector(
                                    onTap: () {
                                      uploaQuestion();
                                    },
                                    child: button(context, 'Add'))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }
}
