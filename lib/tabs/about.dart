import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olympiawork/movie.dart';
import 'package:video_player/video_player.dart';

class About extends StatefulWidget {
  About({required this.movie});
  final Movie movie;

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    final FlickManager flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.asset(widget.movie.video));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Container(
              width: width / 1.2,
              height: height / 3,
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: FlickVideoPlayer(
                flickManager: flickManager,
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.movie.like,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'IMDB',
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        widget.movie.note,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Kinopoisk',
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container()
        ],
      ),
    );
  }
}
