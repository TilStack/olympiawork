import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olympiawork/widget/appBar.dart';

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
            const SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Semaine du 17-23 Oct',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
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
