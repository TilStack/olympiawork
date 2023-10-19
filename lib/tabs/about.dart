import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
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
    var text = lorem(paragraphs: 1, words: 50);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Center(
            child: Container(
              width: width / 1.2,
              height: height / 3,
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 56, 53, 53),
            ),
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    widget.movie.description,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ListTile(
                  leading: Text(
                    "Certificate",
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                  title: Text(
                    "16+",
                    style: GoogleFonts.poppins(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                ListTile(
                  leading: Text(
                    "Runtime",
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                  title: Text(
                    "01:55",
                    style: GoogleFonts.poppins(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                ListTile(
                  leading: Text(
                    "Release",
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                  title: Text(
                    "2023",
                    style: GoogleFonts.poppins(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                ListTile(
                  leading: Text(
                    "Genre",
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                  title: Text(
                    widget.movie.categorie,
                    style: GoogleFonts.poppins(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                ListTile(
                  leading: Text(
                    "Director",
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                  title: Text(
                    "TIL Stack",
                    style: GoogleFonts.poppins(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                ListTile(
                  leading: Text(
                    "Cast",
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                  title: Text(
                    text,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                fixedSize: Size(width / 1.3, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              child: Text(
                "Select Session",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
