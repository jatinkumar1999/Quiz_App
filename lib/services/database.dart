import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  uploadUsersInfo(String email, userName) async {
    return await FirebaseFirestore.instance.collection('Quiz_app_users').add(
      {
        'email': email,
        'userName': userName,
      },
    ).catchError(
      (e) {
        print(e.toString());
      },
    );
  }

  createQuiz(Map quizMap, String quizID) async {
    await FirebaseFirestore.instance
        .collection('Quiz')
        .doc(quizID)
        .set(quizMap)
        .catchError((e) {
      print(e);
    });
  }

  addQuizQuestion(String quizID, Map questionData) async {
    await FirebaseFirestore.instance
        .collection('Quiz')
        .doc(quizID)
        .collection('QNA')
        .add(questionData)
        .catchError((e) {
      print(e);
    });
  }

  getQuizData() async {
    return FirebaseFirestore.instance.collection('Quiz').snapshots();
  }

  getQuizQuestionData(String quizID) async {
    return await FirebaseFirestore.instance
        .collection('Quiz')
        .doc(quizID)
        .collection('QNA')
        .get();
  }

  deletequiz(String quizid) {
    return FirebaseFirestore.instance.collection('Quiz').doc(quizid).delete();
  }

  

 
}
