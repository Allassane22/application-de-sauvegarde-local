import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _authkey = 'is_logged_in';
  static const String _nameKey = 'user_name';

  //variable privé qui stock l'instance
  static SharedPreferences? _prefs;

  //Méthode pour initialiser l'instance une seul fois
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //connexion
  Future<void> login(String name) async {
    //Permet de modifier l'état de connection
    await _prefs?.setBool(_authkey, true);
    // Permet de récupérer le nom de l'utilisateur connecté
    await _prefs?.setString(_nameKey, name);
  }

  //Déconnexion
  Future<void> logout() async {
    await _prefs?.remove(_authkey);
    
    await _prefs?.remove(_nameKey);
  }

  //Verification
  bool isLoggedIn() {
    return _prefs?.getBool(_authkey) ?? false;
  }

  //récupérer le nom de l'utilisateur connecté
  String getUserName() {
    return _prefs?.getString(_nameKey) ?? "utilisateur";
  }
}
