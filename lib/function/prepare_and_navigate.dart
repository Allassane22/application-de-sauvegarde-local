import 'package:first_app_ath/function/navigateToNext.dart';
import 'package:first_app_ath/function/setupTestUser.dart';
import 'package:first_app_ath/model/auth.dart';

Future<void> prepareAndNavigate(dynamic context) async {
  //On attend que sharedPreferences soit prêt
  await AuthService.init();
  //un User de test
  await setupTestUser();
  //verifie si un utilisateur est connecté, en fonction de la réponse redirige vers la bonne page
  await navigateToNext(context);
}
