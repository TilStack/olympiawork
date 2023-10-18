import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olympiawork/movie.dart';

class Session extends StatefulWidget {
  Session({required this.movie});
  final Movie movie;

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  List<String> location = [
    "Yaoundé 1, Yaoundé Cameroun",
    "Bessengue, Douala Cameroun",
    "WOLOGUEDE, Cotonou BENIN",
    "M'PITA, Pointe Noire Congo",
    "POPO, Brazaville Congo",
    "KALOUM, Conakry Guinée",
    "GODOPE, Lomé Togo",
    "MIDE, Lomé Togo",
    "MIDE, Lomé Togo",
    "Teranga, Dakar Sénégal",
    "MIDE, Lomé Togo",
    "WOLOGUEDE, Cotonou BENIN",
  ];
  int b = 8;
  double price = 1499;
  bool boolean = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Oct 18',
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.timelapse,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Time !',
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.switch_access_shortcut,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'By Cinema',
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 5,
            ),
            decoration: BoxDecoration(color: Color.fromARGB(255, 59, 58, 58)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Time",
                  style: GoogleFonts.poppins(
                    color: Colors.white30,
                  ),
                ),
                Text(
                  "Pre First",
                  style: GoogleFonts.poppins(
                    color: Colors.white30,
                  ),
                ),
                Text(
                  "Stand",
                  style: GoogleFonts.poppins(
                    color: Colors.white30,
                  ),
                ),
                Text(
                  "Child",
                  style: GoogleFonts.poppins(
                    color: Colors.white30,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                b++;
                boolean = !boolean;
                price + 100;
                return Card(
                  color: Colors.transparent,
                  elevation: 0.5,
                  child: ListTile(
                    leading: Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Column(
                        children: [
                          Text(
                            '${b}:00',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            boolean ? "VF" : "VOSTFR",
                            style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    title: Container(
                      margin: const EdgeInsets.only(left: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            location[index],
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${price} Frs",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: location.length,
            ),
          )
        ],
      ),
    );
  }
}
