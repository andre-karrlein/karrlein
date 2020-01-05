import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;

  const NavButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.color = Colors.blue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(text),
        color: color,
        onPressed: onPressed,
        highlightColor: color,
        textColor: Colors.white,
    );
  }
}
