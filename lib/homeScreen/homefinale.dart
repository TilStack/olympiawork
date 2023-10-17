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
