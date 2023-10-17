import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olympiawork/homefinale.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Temps défini pour l'animation
    );

    _controller!.forward(); // Lance l'animation

    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // L'animation est terminée, n'effectue aucune action ici
      }
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Obtiens les dimensions de l'écran
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Image dans la division 1
          Positioned(
            top: 0,
            left: 0,
            child: AnimatedBuilder(
              animation: _controller!,
              builder: (context, child) {
                final value = _controller!.value;
                final imageSize = Size(
                  screenWidth * value,
                  screenHeight * value,
                );

                if (value == 1.0) {
                  // Arrête l'animation lorsque l'image a atteint sa taille finale
                  _controller!.stop();
                }

                return Container(
                  width: imageSize.width,
                  height: imageSize.height,
                  child: Image.asset(
                    "assets/images/B.png",
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          // Image dans la division 2
          Positioned(
            bottom: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _controller!,
              builder: (context, child) {
                final value = _controller!.value;
                final imageSize = Size(
                  screenWidth * value,
                  screenHeight * value,
                );

                if (value == 1.0) {
                  // Arrête l'animation lorsque l'image a atteint sa taille finale
                  _controller!.stop();
                }

                return Container(
                  width: imageSize.width,
                  height: imageSize.height,
                  child: Image.asset(
                    "assets/images/A.png",
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          // Bouton
          Positioned(
            bottom:
                screenHeight * 0.2, // Ajuste la position verticale du bouton
            left: screenWidth * 0.2, // Ajuste la position horizontale du bouton
            child: ElevatedButton(
              onPressed: () {
                // Effectue l'action du bouton ici
                // Par exemple, tu peux naviguer vers une autre page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Couleur du bouton en rouge
              ),
              child: Text(
                'Commencer',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
