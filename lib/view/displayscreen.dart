import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            color: Colors.green,
            height: 50,
            width: double.infinity,
            child: Text(
              "Title",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            color: Colors.black,
            child: Text(
              "Date",
              style: TextStyle(color: Colors.white),
            ),
            width: double.infinity,
            height: 50,
          ),
          Container(
            color: Colors.black,
            // height: 50,
            width: double.infinity,
            child: Text(
              "Description",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
