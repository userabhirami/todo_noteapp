import 'package:flutter/material.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget(
      {super.key,
      required this.title,
      required this.description,
      this.date,
      required this.ondeletetap});
  final String title;
  final String description;
  final String? date;
  final VoidCallback? ondeletetap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    InkWell(onTap: ondeletetap, child: Icon(Icons.delete)),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.edit)
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Positioned(
                  top: 0,
                  bottom: 10,
                  right: 20,
                  child: Text(
                    "",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ],
          )
        ],
      ),
      color: Colors.orange,
    );
  }
}
