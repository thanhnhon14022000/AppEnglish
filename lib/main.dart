//import 'package:appenglish/packages/qoute_model.dart';
import 'package:appenglish/packages/quote.dart';
import 'package:flutter/material.dart';
import 'pages/leading_page.dart';

void main() async {//Bat dong bo
  WidgetsFlutterBinding.ensureInitialized();//????
  await Quotes().getAll();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App",
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LeadingPage(),
    );
  }
}
