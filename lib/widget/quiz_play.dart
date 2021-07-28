import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {
  final String option, description, optionSelected, correcrAnswer;
  OptionTile(
      {this.option, this.description, this.optionSelected, this.correcrAnswer});
  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                border: Border.all(
                    color: widget.description == widget.optionSelected
                        ? widget.optionSelected == widget.correcrAnswer
                            ? Colors.green[300]
                            : Colors.red[300]
                        : Colors.grey,
                    width: 2.0),
                borderRadius: BorderRadius.circular(30.0)),
            child: Text(widget.option,
                style: TextStyle(
                  fontSize: 18,
                  color: widget.description == widget.optionSelected
                      ? widget.optionSelected == widget.correcrAnswer
                          ? Colors.green
                          : Colors.red
                      : Colors.grey,
                )),
          ),
          SizedBox(
            height: 30.0,
            width: 10,
          ),
          Text(widget.description,
              style: TextStyle(
                color: Colors.black38,
                fontSize: 17,
              )),
        ],
      ),
    );
  }
}
