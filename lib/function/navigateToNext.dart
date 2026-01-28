import 'package:first_app_ath/model/auth.dart';
import 'package:flutter/material.dart';
import 'package:first_app_ath/screen/Home.dart';
import 'package:first_app_ath/screen/login.dart';
Future <void> navigateToNext(dynamic context) async{
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