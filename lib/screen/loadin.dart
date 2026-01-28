import 'package:first_app_ath/function/prepare_and_navigate.dart';
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
    prepareAndNavigate(context);
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
