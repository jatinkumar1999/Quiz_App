import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz/helper/helper.dart';
import 'package:quiz/services/authentication.dart';
import 'package:quiz/services/database.dart';
import 'package:quiz/views/Login.dart';
import 'package:quiz/views/play_quiz.dart';
import 'package:quiz/views/quiz_create.dart';
import 'package:quiz/widget/widget.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream quizList;
  Widget showquizList() {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: quizList,
          builder: (context, snapshot) {
            return snapshot.data == null
                ? Container()
                : ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onLongPress: () {
                          DataBaseMethods().deletequiz(
                            snapshot.data.docs[index].id,
                          );
                        },
                        child: QuizListTile(
                          imgurl:
                              snapshot.data.docs[index].data()['quizimageURl'],
                          title: snapshot.data.docs[index].data()['quiztittle'],
                          decs: snapshot.data.docs[index]
                              .data()['quizdescription'],
                          quizid: snapshot.data.docs[index].id,
                        ),
                      );
                    });
          }),
    );
  }

  @override
  void initState() {
    DataBaseMethods().getQuizData().then((value) {
      setState(() {
        quizList = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: appBar(),
        actions: [
          GestureDetector(
            onTap: () {
              AuthServices().signout().then((value) {
                HelperMethods.savedUserLoggedInDetails(false);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
              child: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: showquizList(),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.indigo[100],
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Quiz_Create()));
          },
          label: Icon(Icons.add)),
    );
  }
}

class QuizListTile extends StatefulWidget {
  final String imgurl, title, decs, quizid;
  QuizListTile(
      {this.imgurl,
      @required this.title,
      @required this.decs,
      @required this.quizid});
  @override
  _QuizListTileState createState() => _QuizListTileState();
}

class _QuizListTileState extends State<QuizListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayQuiz(widget.quizid),
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueGrey[200],
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: Colors.grey[400],
          ),
        ),
        height: 150.0,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.network(
                widget.imgurl,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  Text(
                    widget.decs,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
