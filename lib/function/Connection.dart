import 'package:first_app_ath/model/auth.dart';
import 'package:first_app_ath/model/user.dart';
import 'package:first_app_ath/screen/Home.dart';
import 'package:flutter/material.dart';
final authService = AuthService();

void connexion(dynamic userNameControlleur,userPasswordControlleur, context,  ) async{
  User? savedUser = authService.getSavedUser();
                      String name = userNameControlleur.text.trim();
                      String password = userPasswordControlleur.text.trim();

                      if (name.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Veuillez remplir tous les champs."),
                          ),
                        );
                      } else {
                        // Pour plus de sécurité, renvoyer un message générique plutôt que "Compte introuvable"
                        if (savedUser == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Identifiants invalides.")),
                          );
                        } else if (savedUser.name == name &&
                            savedUser.password == password) {
                          try {
                            await authService.login(name);
                            if (context.mounted) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Erreur lors de la connexion. Réessayez.",
                                ),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Nom d'utilisateur ou mot de passe incorrect.",
                              ),
                            ),
                          );
                        }
                      }
}