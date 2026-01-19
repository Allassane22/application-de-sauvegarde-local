import 'package:first_app_ath/model/auth.dart';
import 'package:first_app_ath/screen/Home.dart';
import 'package:first_app_ath/screen/login.dart';

import 'package:first_app_ath/core/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void initState() {
    super.initState();

    //Fonction aasynchrone
    Future<void> _navigateToNext() async {
      //On attend que sharedPreferences soit prêt
      await AuthService.init();

      //On récupère l'instance de Service
      final authService = AuthService();

      //on vérifie si l'utilisateur est connecté
      bool isConnected = await authService.isLoggedIn();

      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => isConnected ? Home() : Login(),
          ),
        );
      }
    }

    //Appel de la fonction
    _navigateToNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Center(
            child: Text(
              "AUTH Status: Loading",
              style: GoogleFonts.montserrat(color: Colors.grey[400]),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),

              SizedBox(height: 48),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Mon App Authentifiée",
                  style: GoogleFonts.montserrat(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 48),

              CircularProgressIndicator(
                backgroundColor: Colors.red,
                strokeWidth: 5,
              ),

              SizedBox(height: 48),

              Text(
                "Verification en cour ...",
                style: GoogleFonts.montserrat(
                  color: Colors.grey[400],
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
