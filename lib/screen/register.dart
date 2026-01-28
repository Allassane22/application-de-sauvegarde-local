import 'package:first_app_ath/components/MyButton.dart';
import 'package:first_app_ath/components/TextField.dart';
import 'package:first_app_ath/core/color.dart';
import 'package:first_app_ath/function/inscription.dart';
import 'package:first_app_ath/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final userNameControlleur = TextEditingController();
  final userPasswordControlleur = TextEditingController();
  final userConfirmPasswordControlleur = TextEditingController();
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Image.asset("assets/images/log.png"),
                  ),

                  Text(
                    "s'inscrire",
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

                  SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Textfield(
                      hintText: "Confirm mots de passe utilisateur",
                      obscuredText: true,
                      prefixIcon: Icon(Icons.lock),
                      controller: userConfirmPasswordControlleur,
                    ),
                  ),

                  SizedBox(height: 30),

                  Mybutton(
                    text: "s'inscrire",
                    onTap: () {
                      inscription(
                        userNameControlleur,
                        userPasswordControlleur,
                        userConfirmPasswordControlleur,
                        context,
                      );
                    },
                    color: AppColors.primaryBlue,
                    borderColor: AppColors.primaryBlue,
                    textColor: AppColors.background,
                  ),

                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Text(
                          "Vous avez déjà un compte ?",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(width: 4),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text(
                            "connectez-vous ici",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
