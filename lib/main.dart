import 'package:flutter/material.dart';
import 'package:flutter_application_25/model/notemodel/notemodel.dart';
import 'package:flutter_application_25/view/homescreen.dart';
import 'package:flutter_application_25/view/splashScreen.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // initialize
  Hive.registerAdapter(NotemodelAdapter());
  var box = await Hive.openBox<Notemodel>('myBox'); // open a box
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
