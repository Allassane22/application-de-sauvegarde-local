import 'package:first_app_ath/model/auth.dart';
import 'package:first_app_ath/model/user.dart';

// On a créer un User pour testé le système
Future<void> setupTestUser() async {
  User test = User(name: "Admin", password: "123", id: "1");
  final authService = AuthService();
  await authService.savedUser(test);
}
