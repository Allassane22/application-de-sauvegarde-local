import 'package:first_app_ath/components/MyButton.dart';
import 'package:first_app_ath/core/color.dart';
import 'package:first_app_ath/model/auth.dart';
import 'package:first_app_ath/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final authService = AuthService();
  String userName = "";

  void initState() {
    super.initState();
    setState(() {
      userName = authService.getUserName();
    });
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
              "AUTH Status: logged in",
              style: GoogleFonts.montserrat(color: Colors.grey[400]),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Image.asset("assets/images/hand.png"),
                ),

                Text(
                  "Bienvenu $userName",
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                SizedBox(height: 45),

                Text(
                  "Vous êtes connecté(e)",
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 40),

                Mybutton(
                  text: "Se déconnecter",
                  onTap: () async {
                    await authService.logout();
                    if (context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    }
                  },
                  color: AppColors.alertRed,
                  borderColor: AppColors.alertRed,
                  textColor: AppColors.background,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
