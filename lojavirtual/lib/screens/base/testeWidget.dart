import 'package:flutter/material.dart';

class HomeTeste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(32.0),
          child: Text(
            "data",
            style: TextStyle(color: Colors.blue),
          ),
          color: Colors.white,
        ),
        SizedBox(
          width: 5.0,
        ),
        Container(
          padding: EdgeInsets.all(32.0),
          child: Text(
            "data",
            style: TextStyle(color: Colors.blue),
          ),
          color: Colors.white,
        ),
        SizedBox(
          width: 5.0,
        ),
        Container(
          // height: 10.0,
          padding: EdgeInsets.all(32.0),
          child: Text(
            "data",
            style: TextStyle(color: Colors.blue),
          ),
          color: Colors.white,
        )
      ],
    );
  }
}
