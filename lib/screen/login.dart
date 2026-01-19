import 'package:first_app_ath/components/MyButton.dart';
import 'package:first_app_ath/components/TextField.dart';
import 'package:first_app_ath/core/color.dart';
import 'package:first_app_ath/model/auth.dart';
import 'package:first_app_ath/screen/Home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final authService = AuthService();

  final userNameControlleur = TextEditingController();
  final userPasswordControlleur = TextEditingController();

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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Image.asset("assets/images/log.png"),
                ),

                Text(
                  "Se connecter",
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                SizedBox(height: 45),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Textfield(
                    hintText: "Nom d'utilisateur",
                    obscuredText: false,
                    prefixIcon: Icon(Icons.person),
                    controller: userNameControlleur,
                  ),
                ),

                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Textfield(
                    hintText: "mot de passe utilisateur",
                    obscuredText: true,
                    prefixIcon: Icon(Icons.lock),
                    controller: userPasswordControlleur,
                  ),
                ),

                SizedBox(height: 40),

                Mybutton(
                  text: "Se connecter",
                  onTap: () async {
                    String name = userNameControlleur.text;
                    if (name.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            " Votre champ est vide,veuillez la remplir s'il vous plaît",
                          ),
                        ),
                      );
                    } else {
                      await authService.login(name);
                      if (context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      }
                    }
                  },
                  color: AppColors.primaryBlue,
                  borderColor: AppColors.primaryBlue,
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
