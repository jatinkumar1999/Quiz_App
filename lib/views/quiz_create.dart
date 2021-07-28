import 'package:flutter/material.dart';
import 'package:quiz/services/database.dart';
import 'package:quiz/views/addquestion.dart';
import 'package:quiz/widget/widget.dart';

import 'package:random_string/random_string.dart';

class Quiz_Create extends StatefulWidget {
  Quiz_Create({Key key}) : super(key: key);

  @override
  _Quiz_CreateState createState() => _Quiz_CreateState();
}

class _Quiz_CreateState extends State<Quiz_Create> {
  final formKey = GlobalKey<FormState>();
  String quizimageURl, quiztittle, quizdescription, quizID;
  bool isloading = false;

  addQuiz() {
    if (formKey.currentState.validate()) {
      setState(() {
        isloading = true;
      });
      quizID = randomAlphaNumeric(16);
      Map<String, String> quizMap = {
        'quizID': quizID,
        'quizimageURl': quizimageURl,
        'quiztittle': quiztittle,
        'quizdescription': quizdescription,
      };

      DataBaseMethods().createQuiz(quizMap, quizID);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => AddQuestion(quizID)));
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
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Color.fromRGBO(143, 148, 251, 1),
                                offset: Offset(0, 5),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                child: Form(
                                  key: formKey,
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
                                              ? 'enter a valid URL'
                                              : null,
                                          onChanged: (value) {
                                            setState(() {
                                              quizimageURl = value;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            hintText: "URL",
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
                                          decoration: decoration(
                                              'Quiz question tittle'),
                                          onChanged: (value) {
                                            setState(() {
                                              quiztittle = value;
                                            });
                                          },
                                          validator: (value) => value.isEmpty
                                              ? 'enter a quiz tittle'
                                              : null,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[100])),
                                        ),
                                        child: TextFormField(
                                          decoration:
                                              decoration('Quiz description'),
                                          onChanged: (value) {
                                            setState(() {
                                              quizdescription = value;
                                            });
                                          },
                                          validator: (value) => value.isEmpty
                                              ? 'enter a quiz description'
                                              : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            addQuiz();
                          },
                          child: Container(
                            width: 150,
                            height: 60.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.indigo[200],
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text(
                              "Create Quiz",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    )),
              ));
  }
}
