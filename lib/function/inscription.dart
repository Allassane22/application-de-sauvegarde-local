import 'package:first_app_ath/model/auth.dart';
import 'package:first_app_ath/model/user.dart';
import 'package:first_app_ath/screen/Home.dart';
import 'package:flutter/material.dart';

void inscription(
  dynamic userName,
  userPassword,
  userConfirmPassword,
  context,
) async {
  String name = userName.text.trim();
  String password = userPassword.text.trim();
  String confirmPassword = userConfirmPassword.text.trim();
  String uniqueId = DateTime.now().microsecondsSinceEpoch.toString();
  final authService = AuthService();
  if (name.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Veuillez remplir tous les champs.")),
    );
  } else if (password != confirmPassword) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Les mots de passe ne correspondent pas. Veuillez vérifier et réessayer.",
        ),
      ),
    );
  } else {
    User newUser = User(name: name, password: password, id: uniqueId);
    User? existingUser = authService.getSavedUser();
    if (existingUser != null && existingUser.name == name) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ce nom d'utilisateur est déjà pris !")),
      );
    } else {
      try {
        await authService.savedUser(newUser);
        await authService.login(name);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Compte créé avec succès ! Connectez-vous."),
            ),
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Home()),
            (route) => false,
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erreur lors de l'inscription. Réessayez.")),
        );
      }
    }
  }
}
