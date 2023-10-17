import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olympiawork/widget/appBar.dart';
import 'package:olympiawork/widget/movieDetails.dart';
import '../movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    "Teranga, Dakar Sénégal"
  ];
  List<String> langues = [
    "Arabe",
    "Francais",
    "English",
    "Spanish",
    "Japenese"
  ];
  List<String> uptitle = [
    "Les nouveautés",
    "Prochaines sorties",
    "En premiere ligne"
  ];
  List<bool> uptitlebool = [true, false, false];
  List<Movie> movies = [];
  @override
  void initState() {
    super.initState();
    movies = rawData
        .map(
          (e) => Movie(
              title: e['title'],
              image: e['image'],
              index: e['index'],
              like: e['like'],
              note: e['note'],
              categorie: e['categorie'],
              time: e['time']),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 40, 40),
      appBar: appBarWidget(
        context,
        () => _displayBottomSheetLocation(context),
        () => _displayBottomSheetLanguage(context),
        () => _displayBottomSheetLogin(context),
        location: "Bessengue",
        language: "Eng",
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                      border: Border.all(color: Colors.grey),
                      color: uptitlebool[index]
                          ? Colors.white
                          : Colors.transparent,
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          uptitle[index],
                          style: GoogleFonts.poppins(
                            color: uptitlebool[index]
                                ? Colors.black
                                : Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color:
                              uptitlebool[index] ? Colors.black : Colors.white,
                          size: 15,
                        ),
                      ],
                    ),
                  );
                }),
                itemCount: uptitle.length,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: CarouselSlider.builder(
                itemCount: movies.length,
                itemBuilder: ((context, index, realIndex) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MoviesDetails(movie: movies[index]),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            movies[index].image,
                            height: 300,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.black.withOpacity(0.6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movies[index].title,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      movies[index].note,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Row(
                                      children: List.generate(
                                        5,
                                        (_) => const Icon(
                                          Icons.star,
                                          color: Colors.red,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Row(
                            children: [
                              const Icon(Icons.favorite, color: Colors.red),
                              const SizedBox(width: 4),
                              Text(
                                movies[index].like,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  viewportFraction: 0.55,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      'Semaine du 17-23 Oct',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 25,
                    ),
                  ),
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: MasonryGridView.builder(
                      itemCount: movies.length,
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MoviesDetails(movie: movies[index]),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                      movies[index].image,
                                    ),
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.red,
                                            ),
                                            child: Text(
                                              movies[index].time,
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  movies[index].title,
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  movies[index].categorie,
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _displayBottomSheetLocation(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Color.fromARGB(255, 42, 39, 39),
      isDismissible: true,
      barrierColor: Colors.black87.withOpacity(0.5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Search an Localisation",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: TextField(
                  style: GoogleFonts.poppins(color: Colors.grey),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 42, 39, 39),
                      ),
                    ),
                    hintText: "eg: Douala-Akwa",
                    hintStyle: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 183, 179, 179),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    prefixIconColor: Colors.white54,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                height: 250,
                child: ListView.builder(
                  itemCount: location.length,
                  itemBuilder: (ctx, i) {
                    return ListTile(
                      leading: Container(width: 30),
                      onTap: () {},
                      title: Text(
                        location[i],
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _displayBottomSheetLanguage(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Color.fromARGB(255, 42, 39, 39),
      isDismissible: true,
      barrierColor: Colors.black87.withOpacity(0.5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height / 3.5,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: langues.length,
                  itemBuilder: (ctx, i) {
                    return ListTile(
                      leading: Container(width: 30),
                      onTap: () {},
                      title: Text(
                        langues[i],
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _displayBottomSheetLogin(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Color.fromARGB(255, 42, 39, 39),
      isDismissible: true,
      barrierColor: Colors.black87.withOpacity(0.5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height / 3.5,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Access to purchased tickets",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: TextField(
                  style: GoogleFonts.poppins(
                      color: Color.fromARGB(255, 185, 182, 182)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    hintText: "698 52 49 56",
                    hintStyle: GoogleFonts.poppins(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    prefixIconColor: Colors.white54,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(350, 50),
                    elevation: 1,
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
