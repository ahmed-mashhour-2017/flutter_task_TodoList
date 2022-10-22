import 'package:assignmen_day3_tasks/AddStudentScreen.dart';

import 'package:assignmen_day3_tasks/EditStudentScreen.dart';

import 'package:assignmen_day3_tasks/ListScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => ListScreen(),
        "/add": (context) => AddStudentScreen(),
        "/edit": (context) => EditStudentScreen(),
      },
    );
  }
}
