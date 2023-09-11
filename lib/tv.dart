// ignore_for_file: unused_import, camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_if_null_operators, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:tmdb_api_movie_app/description.dart';

class TV extends StatelessWidget {
  final List tv;

  TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular TV Shows ",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.white),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                  name: tv[index]["original_name"],
                                  description: tv[index]["overview"],
                                  bannerUrl: "https://image.tmdb.org/t/p/w500" +
                                      tv[index]["backdrop_path"],
                                  vote: tv[index]["vote_average"].toString(),
                                  launchOn: tv[index]["release_date"],
                                  posterURl: "https://image.tmdb.org/t/p/w500" +
                                      tv[index]["poster_path"],
                                )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w500" +
                                          tv[index]["poster_path"]))),
                        ),
                        Container(
                          child: Text(
                            tv[index]["original_name"] != ""
                                ? tv[index]["original_name"]
                                : "Loading",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
