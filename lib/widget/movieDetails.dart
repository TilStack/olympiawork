import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olympiawork/movie.dart';
import 'package:olympiawork/tabs/session.dart';

import '../tabs/about.dart';

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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 40, 40),
        centerTitle: true,
        title: Text(
          'Expendables4',
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "About",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Session",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.red,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  About(movie: widget.movie),
                  Session(
                    movie: widget.movie,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
