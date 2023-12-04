import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'notemodel.g.dart';

@HiveType(typeId: 1)
class Notemodel {
  Notemodel(
      {required this.title,
      required this.date,
      required this.description,
      required this.color});
  @HiveField(0)
  String title;
  @HiveField(1)
  String date;
  @HiveField(2)
  String description;
  @HiveField(3)
  int color;
}
