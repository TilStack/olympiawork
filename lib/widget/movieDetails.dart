import 'package:flutter/material.dart';
import 'package:olympiawork/movie.dart';

class MoviesDetails extends StatefulWidget {
  MoviesDetails({required this.movie});
  final Movie movie;

  @override
  State<MoviesDetails> createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 40, 40),
      appBar: AppBar(),
    );
  }
}
