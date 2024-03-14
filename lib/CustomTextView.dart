import 'package:flutter/material.dart';

class CustomTextView extends StatelessWidget {
  final String text;
  final String hinttext;

  CustomTextView({required this.text, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  // Define your text style here
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              Text(
                "*",
                style: TextStyle(
                  // Define your text style here
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2,
          ),
          TextField(
            decoration: InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              hintText: hinttext,
              border: OutlineInputBorder(),
            ),
          )
        ],
      ),
    );
  }
}