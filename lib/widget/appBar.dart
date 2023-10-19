import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const.dart';
import '../splashScreen/splash1.dart';

AppBar appBarWidget(BuildContext context, Function()? function1,
    Function()? function2, Function()? function3,
    {required String location, required String language}) {
  return AppBar(
    backgroundColor: appBarBackground,
    leading: GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SplashScreen(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.cover,
          height: 10,
          width: 10,
        ),
      ),
    ),
    title: GestureDetector(
      onTap: function1,
      child: Row(children: [
        const Icon(
          Icons.location_city,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            location,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ]),
    ),
    actions: [
      GestureDetector(
        onTap: function2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.language,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text(
                language,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(right: 8),
        child: ElevatedButton(
          onPressed: function3,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              )),
          child: Text(
            'Log In',
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  );
}
