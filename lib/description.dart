// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, prefer_if_null_operators, unnecessary_null_comparison

import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, bannerUrl, vote, launchOn, posterURl;

  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerUrl,
      required this.vote,
      required this.launchOn,
      required this.posterURl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        toolbarHeight: 30,
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: Image(
                      image: NetworkImage(
                        bannerUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Text(
                    " ⭐ Average Rating - " + vote,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.003,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Text(
              name != "" ? name : "Not Loaded",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Releasing On - " + launchOn,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Image.network(posterURl),
              ),
              Flexible(
                child: Container(
                  child: Text(
                    description,
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
