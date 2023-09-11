// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:tmdb_api_movie_app/movies.dart';
import 'package:tmdb_api_movie_app/trending.dart';
import 'package:tmdb_api_movie_app/tv.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  final String apiKey = "5f00bef64655fb7cbb84fad43ef46d85";
  final String readAbleToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZjAwYmVmNjQ2NTVmYjdjYmI4NGZhZDQzZWY0NmQ4NSIsInN1YiI6IjY0ZmM5MDYwNmEyMjI3MDBlMGYwNmJiOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.F1ruNm8gQ5iOdqsTRYw9eQT8aMJ9_u2XB-s85aDUSKw";

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAbleToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResult["results"];
      topRatedMovies = topResult["results"];
      tv = tvResult["results"];
    });
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.05,
        backgroundColor: Colors.black,
        title: Text(
          "Movies App 🤍 ",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          movies(toprated: topRatedMovies),
          trending_Movies(trending: trendingMovies),
          TV(tv: tv),
        ],
      ),
    );
  }
}
