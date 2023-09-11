// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tmdb_api_movie_app/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TMDB API Movies App",
      home: HomeScreen(),
    );
  }
}
