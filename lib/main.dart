import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz/helper/helper.dart';
import 'package:quiz/views/Login.dart';
import 'package:quiz/views/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn;

  @override
  void initState() {
    checkUserLoggedInStatus();
    super.initState();
  }

  checkUserLoggedInStatus() {
    return HelperMethods.getUserLoggedInDetails().then((value) {
      setState(() {
        isLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLoggedIn != null
          ? /**/
          isLoggedIn
              ? Home()
              : Login()
          /**/ : Login(),
    );
  }
}
