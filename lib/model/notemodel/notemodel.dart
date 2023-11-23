import 'package:flutter/material.dart';

class Notemodel {
  Notemodel(
      {required this.title,
      required this.date,
      required this.description,
      required this.color});
  String title;
  String date;
  String description;
  int color;
}
