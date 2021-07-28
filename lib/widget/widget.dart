import 'package:flutter/material.dart';

Widget appBar() {
  return RichText(
    text: TextSpan(
      text: 'Quiz',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      children: [
        TextSpan(
          text: 'Maker',
          style: TextStyle(
            fontSize: 20,
            color: Colors.indigo[400],
            fontWeight: FontWeight.w900,
          ),
        )
      ],
    ),
  );
}

textStyle() {
  return TextStyle(
    color: Colors.white,
  );
}

decoration(String text) {
  return InputDecoration(
    border: InputBorder.none,
    hintText: text,
  );
}

button(BuildContext context, String text) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60.0,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.indigo[200],
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: Text(
      text,
      style: TextStyle(fontSize: 20.0, color: Colors.white),
    ),
  );
}

getresult(int a, String text) {
  return Container(
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              )),
          child: Text(
            a.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.indigo[300],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              )),
          child: Text(
            text,
            style: TextStyle(fontSize: 15.0, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
